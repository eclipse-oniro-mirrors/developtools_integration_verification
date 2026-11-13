# 列表取数为什么慢：两次相关子查询事故

日期：2026-10-19
状态：**已修**（`model/lists.js`、`components/EntityTable.vue`、`model/fields.js`、`tools/perf.mjs`）
库：`viewer/knowledge.db`（rk3568 · scan #1 · 3,520 ELF / 33,367 条依赖边 / 382 部件）

结论先行：`#/files/elf` 出第一行要 **7.9 s**，其中 **5.7 s 是一条 SQL**——`loadElfModules` 里
统计"未解析依赖数"的相关子查询，在没有 `sqlite_stat1` 的库上被 planner 配到了
`(scan_id, resolution)` 这个只有两个取值的索引，于是 3,520 个外层行 × 3,430 条未解析边
≈ **1,200 万次回表**。改成"先 GROUP BY 再 JOIN"之后同一条查询 **81 ms**，整页首行
**1.3 s**，与其余三个列表同量级。顺带查出同一类问题的第二例（部件列表 264 ms → 12 ms）。

两例的共性是一条可以写进纪律的规则：**在这个库里，任何相关子查询都必须能沿索引 seek。**
索引一律以 `scan_id` 打头，所以子查询的 WHERE 必须同时给出 `scan_id` 与外键；给不全时
planner 只能扫整个索引，代价是"外层行数 × 全表"。

---

## 1. 症状

`#/files/elf` 打开后长时间白屏。Chrome 无头 + CDP 采样，修复前：

```
首行出现 7868 ms · CPU 采样 9049 ms
  1191 ms  13.2%  wasm-function[1520]  sql-wasm.wasm      ← SQLite 的 b-tree 回表
   781 ms   8.6%  wasm-function[403]   sql-wasm.wasm
   585 ms   6.5%  read                 sql-wasm.js:113
  1012 ms  11.2%  (idle)                                  ← 主线程被 WASM 独占，页面动不了
```

采样里几乎全是 `sql-wasm.wasm` 的匿名函数，Vue 与 el-table 排不进前 18——**慢在取数，不在渲染**。
同一台机器上其余列表首行 1.1 s 左右，ELF 是唯一的离群点。

## 2. 定位

把 SQL 逐个部件拆掉重测（sql.js 与浏览器同一引擎、同一份库）：

| 变体 | 耗时 |
| --- | ---: |
| 现状（两个相关子查询） | 5,703 ms（第二次 4,827 ms） |
| 只去掉 `unresolved` 子查询 | **55 ms** |
| 只去掉 `dependents` 子查询 | 4,842 ms |
| 不取 `needed` 这一大列 | 4,820 ms（无关） |
| 两张派生表各 JOIN 一次 | **61 ms** |

一条子查询占了 99% 的时间。为什么是它、不是同样形状的 `dependents`：

```
EXPLAIN QUERY PLAN（修复前，库里没有 sqlite_stat1）
|--SEARCH e USING COVERING INDEX idx_elf_modules_component (scan_id=?)
|--CORRELATED SCALAR SUBQUERY 2   ← unresolved
|  `--SEARCH d USING INDEX idx_elf_module_dependencies_resolution (scan_id=? AND resolution=?)   ✗
|--CORRELATED SCALAR SUBQUERY 1   ← dependents
|  `--SEARCH d USING COVERING INDEX idx_elf_module_dependencies_callee (scan_id=? AND callee_id=?) ✓
```

`dependents` 的条件 `(scan_id, callee_id)` 正好是 `idx_elf_module_dependencies_callee` 的前缀，
一次 seek 搞定。`unresolved` 的条件是 `(scan_id, caller_id, resolution)`，**没有这个形状的索引**：
`caller_id` 只出现在 `UNIQUE (scan_id, caller_id, needed_ordinal)` 的自动索引里，而
`(scan_id, resolution)` 是显式命名的。没有统计信息时 planner 按"命名索引优先、行数估算靠猜"
选了后者——`resolution` 只有 resolved / unresolved 两个值，选中 3,430 行，每个外层行都要
把这 3,430 行回表一遍再丢掉。

同一份库跑一次 `ANALYZE`，planner 立刻改选自动索引，查询掉到 100 ms；
`INDEXED BY sqlite_autoindex_elf_module_dependencies_1` 也能钉住计划（10 ms）。
两条都没采用：前者把性能押在"扫描器哪天记得跑 ANALYZE"上，后者要写死内部自动索引名。
**采用的写法与统计信息无关**：先把两张聚合表算出来，各 JOIN 一次。

```sql
WITH in_degree AS (
       SELECT callee_id AS id, COUNT(*) AS n FROM elf_module_dependencies
        WHERE scan_id = ? AND callee_id IS NOT NULL GROUP BY callee_id),
     unresolved_by AS (
       SELECT caller_id AS id, COUNT(*) AS n FROM elf_module_dependencies
        WHERE scan_id = ? AND resolution = 'unresolved' GROUP BY caller_id)
SELECT e.*, …, COALESCE(i.n, 0) AS dependents, COALESCE(u.n, 0) AS unresolved
  FROM elf_modules e
  LEFT JOIN components c        ON c.id = e.component_id
  LEFT JOIN install_modules m   ON m.id = e.install_module_id
  LEFT JOIN in_degree i         ON i.id = e.id
  LEFT JOIN unresolved_by u     ON u.id = e.id
 WHERE e.scan_id = ?
 ORDER BY dependents DESC
```

`COALESCE` 不能省：相关子查询的 `COUNT(*)` 没命中时给 `0`，LEFT JOIN 给的是 `NULL`，
而列表列与排序都区分 `0` 与"未声明"（`model/fields.js` 的三态规则）。

## 3. 第二例：子查询漏了 `scan_id`

`loadComponents` 只有 382 行却要 255 ms。计划是 `SCAN x USING COVERING INDEX idx_features_component`
——**SCAN 不是 SEARCH**：七个计数子查询都只写了 `WHERE a.component_id = c.id`，
而索引是 `(scan_id, component_id)`，前导列没约束就没法 seek，只能每个外层行扫一遍整个索引。
补上 `a.scan_id = c.scan_id` 后七条全部变成 SEARCH，255 ms → 12 ms（结果逐行逐列一致）。
`loadRepos` 同病，18 ms → 6 ms。

单条子查询的代价（382 个部件，sql.js）：

| 子查询 | 缺 scan_id | 补上之后 |
| --- | ---: | ---: |
| `install_modules`（5,506 行） | 120.7 ms | ~1 ms |
| `innerapis` | 67.0 ms | ~1 ms |
| `features` | 30.6 ms | ~1 ms |
| `syscaps` / `services` / `sas` / `hdis` | 2–8 ms | ~1 ms |

## 4. 顺手清掉的两处渲染浪费

取数修好后剩下的 1.3 s 里，有两处与 EL-table 的默认行为有关，量出来才知道值得改：

1. **`el-popover` 默认 `persistent: true`，内容在挂载时就渲染**（`shouldRender = persistent ? true : open`）。
   表头每个 ⓘ 的"本次扫描的分布"因此在打开页面时就全算一遍，而模板里同一列还调了三次
   `dist()`：8 个可见列 × 3 次 × 3,520 行 ≈ **31 ms/次渲染**，每次改筛选都重来。
   改法：弹层加 `:persistent="false"`（点开才算），`dist` 按"这一批 rows"缓存一次。
   单元格里"超量内容 ⤢"的弹层同理——一页 100 行里几十格都白建了 popper。
2. **`sortRows` 在比较器里调 `get()`**，而 `get()` 会跑列目录的 `value()` 派生：
   3,520 行按派生列排序 = O(n log n) 次派生，16.6 ms。改成先取值再排（decorate–sort），
   2.2 ms；`Array#sort` 稳定，等值行顺序与改前一致（30 组 列 × 方向 全等验证过）。

## 5. 修复后的端到端拆分

`performance.mark` 埋点（临时加、量完即撤），Chrome 无头、dev server、库已在 HTTP 缓存里：

| 阶段 | 耗时 | 备注 |
| --- | ---: | --- |
| 应用 bundle + Vue 启动 | 282 ms | DOMContentLoaded |
| fetch `knowledge.db` | 230 ms | **15.9 MB**；走网络时这一项按带宽线性放大 |
| sql.js wasm 初始化 + 打开库 | 30 ms | 整库拷进 WASM 内存 |
| `loadElfModules` | 122 ms | 修复前 4,900–5,800 ms |
| 分面 computeds + EntityTable + el-table 渲染 | ~190 ms | 3,520 行进、100 行出 |
| el-table 布局与首次绘制 | ~250 ms | |
| **首行出现** | **1,282 ms** | 修复前 7,868 ms |

`npm run perf`（预算 3,000 ms）：

```
✓ 首页 LCP（未加载 db）      372 ms   ✓ #/parts/components  1,235 ms
✓ #/runtime/services      1,144 ms   ✓ #/files/image         700 ms
✓ #/files/elf             1,216 ms   ✓ 运行视图切换筛选        176 ms
```

`#/files/elf` 这条预算是本次新加进 `tools/perf.mjs` 的，专门拦它回头。

## 6. 还没做、但值得做的

| 事项 | 收益 | 代价 |
| --- | --- | --- |
| 扫描器侧：`elf_module_dependencies` 加 `(scan_id, caller_id, resolution)` 索引，或扫完跑一次 `ANALYZE` | 任何直接查库的消费者（含未来的 viewer 查询、`oskm query`）都不会再踩这个坑 | 改 `oskm/collectors/elf_modules/collector.py` 的 `indexes=`；索引多一份写放大 |
| 列表 SQL 不取 `needed`（645 KB JSON），改在 SQL 里 `json_array_length()` | 取数 122 ms 里能省下十几 ms 与一次 3,520 次 `JSON.parse` | 展开行/档案若要 `needed` 得单独查 |
| el-table 渲染（~440 ms/页） | 换 `el-table-v2` 虚拟滚动可省掉分页 | `el-table-v2` 的展开行只支持树形数据，装不下现有自定义面板（`tools/perf.mjs` 里已记录过这次权衡） |

## 7. 复现

```bash
cd packages/oskm/viewer
npm run dev &                     # 5173
npm run perf                      # 含 #/files/elf 的预算
node tools/smoke.mjs              # ELF 列表计数 / 默认排序 / 档案登记 等 23 条

# SQL 层：同一份库、同一引擎，逐个部件拆
node - <<'EOF'
import { readFileSync } from 'node:fs'
const initSqlJs = (await import('sql.js')).default
const SQL = await initSqlJs({ locateFile: () => './public/sql-wasm.wasm' })
const db = new SQL.Database(new Uint8Array(readFileSync('./knowledge.db')))
const t = Date.now(), s = db.prepare(/* 待测 SQL */)
s.bind([1]); let n = 0; while (s.step()) { s.getAsObject(); n++ }
console.log(Date.now() - t, 'ms', n, 'rows')
EOF

# 看计划：出现 SCAN 而不是 SEARCH，就是子查询没法沿索引 seek
sqlite3 knowledge.db "EXPLAIN QUERY PLAN <待测 SQL>"
```

**别用 `SELECT COUNT(*) FROM (…)` 给子查询计时**：SQLite 会把外层不需要的相关子查询整个优化掉，
量出来是 7 ms 的假象（本次定位时先踩了这个坑）。用 `SELECT max(x) FROM (…)` 或直接把行取出来。
