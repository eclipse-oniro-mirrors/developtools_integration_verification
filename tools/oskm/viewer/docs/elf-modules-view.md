# ELF 模块与依赖：展示设计

日期：2026-10-19
版本：1.0
状态：**设计**，未实施。本文全部数字来自 `viewer/knowledge.db`（rk3568 · 扫描 #1 · elf_modules schema 2.0.0），复现方法见 §10。

针对："针对 elf_modules 和 viewer 框架，设计如何将 elf_modules 及依赖信息友好展示出来。"

结论先行：**数据已经够了，缺的是解释。** 3520 个 ELF、33367 条 `DT_NEEDED` 边已经全部落库，铺一张表也能看，但有四个事实会让人读错（§3）：3430 条"未解析"里 3406 条是同一个名字 `libc.so`；被依赖数第一名 2944 是编译器运行时；14 个同名库里有 6 个的胜负是扫描器的字典序定的、不是运行时保证；62% 的模块没有直接依赖方，但没有一个是"没人用"。所以设计的重心不是"再画一张图"，而是**把每条边为什么是这个结果讲清楚**，并且只在有边界的地方画图。

落点：不新开一级菜单，`系统文件` 组下加一个二级视图 `ELF 模块`（`#/files/elf`），复用 `EntityTable`；依赖信息分三个有边界的表面（列表度数列 → 展开行 1 跳清单 → 档案抽屉的分层影响面）；**不做全量力导向图**（ux-design §14 已否决，本次实测更支持：入度最大 2944、反向闭包最大 3384 / 3520）。

---

## 1. 方案三句话

| 做什么 | 为什么 |
| --- | --- |
| `#/files/elf` 列表：3520 行，`EntityTable` + 分页 + 列目录 | 与"安装目标"同一套代码，零新轮子；ELF 是安装目标的子集（3520 / 5809），读者心智连续 |
| 依赖只用三种有边界的形态：度数列、1 跳清单、分层影响面 | 出度 ≤ 128 可以全列；入度 ≤ 2944 必须按部件聚合；闭包 ≤ 3384 只能按距离分层 |
| 每条边都带"为什么命中这一份"（目录 rank / SONAME / 遮蔽） | deps_guard 的取舍规则是本域独有信息，不讲就等于让人猜 |

一条纪律沿用 `model/fields.js`：**事实与推断分开标注**。库里的列是事实（`dest` / `soname` / `needed` / `resolution`），
"影响面档位"是派生，必须在 ⓘ 说明里写明是怎么派生的。

---

## 2. 数据基线（本文所有设计的依据）

| 指标 | 值 | 对展示的含义 |
| --- | ---: | --- |
| `elf_modules` | 3,520 | 5,809 个安装目标里 60.6% 是 ELF，另 2,289 个是配置 / 资源 |
| `elf_module_dependencies` | 33,367 | 等于全部 `needed[]` 长度之和，一条不多一条不少 |
| resolved / unresolved | 29,937 / 3,430 | unresolved 不是错误，是数据事实（§3.1） |
| 分区 | system 3,070 · vendor 293 · updater 138 · ramdisk 11 · updater_vendor 8 | 只有 system + vendor 的 3,363 个参与同名命中 |
| format / machine | ELF32LE 3,516 · ELF64LE 4；machine 40(ARM) 3,516 · 183(AArch64) 3 · 247(RISC-V) 1 | rk3568 是 32 位 ARM 产品，4 个 64 位文件是例外，值得单独看得见 |
| ELF type | dyn 3,518 · rel 1 · exec 1 | **PIE 可执行文件也是 dyn**，这一列分不出"库还是程序" |
| soname | 未声明 232；与文件名不同 5 | 那 5 条正是"按名字反查查不到"的原因（§5.4） |
| 出度（直接依赖数） | p50 8 · 均值 9.5 · max 128 · 0 个的有 9 | 最长清单 128 行，展开行可以全列 |
| 入度（被依赖数） | p50 3 · max 2,944 · **入度 0 的有 2,199（62%）** | 入度必须聚合，不能逐条列（§3.2） |
| 正向闭包 | p50 39 · p90 221 · max 446 | "它依赖谁"可以按部件聚合后一屏放下 |
| 反向闭包（影响面） | p50 0 · p90 140 · p99 1,723 · max 3,384（96% 的镜像） | 只能分层 + 百分比，逐条列等于刷屏（§3.2） |
| 最远距离 | 12 跳（抽样 400 个模块） | 分层显示的层数上限是个位数到十几 |
| 环 | **0 个非平凡 SCC** | 直接依赖图是 DAG，树形 / 分层渲染安全，不需要处理循环依赖 |
| 跨部件边 | 25,163 / 29,937（84%）；跨子系统 22,734（76%） | ELF 依赖图天然是跨部件视图，比声明依赖更接近真实 |
| 跨分区边 | vendor → system 1,690；system → vendor **0** | 一条干净的架构事实，值得在列表里做成一个筛选 |
| 同名副本 | 全镜像 152 个名字 > 1 份（最多 3 份）；可命中池内只有 **14** 个 | 14 个才是"遮蔽"，其余 138 个是 ramdisk / updater 副本（§3.3） |
| 所属部件 | 324 / 382 个部件有 ELF 产物 | 58 个部件没有 ELF（纯 ArkTS / 配置 / 头文件库） |
| `ELF_PARSE_FAILED` | 25 条 | 22 条是扫描进程没读权限，不是文件坏了（§5.5） |
| 与运行镜头的连通性 | services.executable 命中 162/164；sas.libpath 命中 161/165；hdis.library 命中 46/46 | ELF 能接回"谁把这个 so 装进了进程" |

目录分布（107 个目录，前 7）：`system/lib` 1,113 · `system/lib/platformsdk` 733 · `vendor/lib` 258 ·
`system/lib/module` 149 · `system/lib/module/ani` 125 · `system/bin` 111 · `system/lib/ndk` 111。

---

## 3. 四个会把人带沟里的事实

"友好"不是排版漂亮，是**不让人误读**。这四条决定了列表里哪些列必须存在、哪些数字必须换一种说法。

### 3.1 3,430 条"未解析"里 3,406 条是同一个名字

| needed_name | 边数 | 镜像里有同名文件吗 | 有 SONAME 命中吗 |
| --- | ---: | --- | --- |
| `libc.so` | 3,406 | 没有 | **有**：`system/lib/ld-musl-arm.so.1` 的 SONAME 就是 `libc.so` |
| `libinit_module_engine.so` | 12 | 没有 | 没有（调用方全在 `system/lib/init/*`） |
| `libappspawn_module_engine.so` | 7 | 没有 | 没有（调用方全在 `system/lib/appspawn/*`） |
| `librga.so.2` | 4 | 没有 | **有**：`vendor/lib/passthrough/indirect/librga.z.so` 的 SONAME 是 `librga.so.2` |
| `libnative_drawing.so` | 1 | 没有 | 没有（调用方 `system/lib/platformsdk/libnweb_ohos_adapter.z.so`） |

musl 把 libc 合进了动态链接器本体，镜像里不存在名为 `libc.so` 的文件。采集器按 **basename 对 `file_name`**
匹配（与 deps_guard 的 `ElfFileMgr` 一致），所以这 3,406 条判 unresolved——**这是规则的事实，不是产品缺陷**。

展示要求：

- 未解析**必须先按名字聚合再显示**。5 个名字占 3,430 条边，逐条列等于把同一件事说 3,430 遍。
- 分两档，档位由 viewer 现算（`needed_name` 是否等于某个 `elf_modules.soname`，不依赖任何顺序表）：
  - **SONAME 命中（3,410 条 / 2 个名字）**：灰色、默认折叠，说明"由动态链接器按 SONAME 提供，镜像里没有同名文件"。
  - **镜像内确实没有（20 条 / 3 个名字）**：琥珀色、默认展开，把全部 20 个调用方列出来（一屏放得下）。
    其中 `*_module_engine.so` 的 19 条，调用方分别集中在 `system/lib/init/` 与 `system/lib/appspawn/` 两个目录族——
    **这是推断**（运行时按路径 dlopen 的模块引擎），ⓘ 说明里必须写成推断，不能写成事实。
- 列表里的"未解析数"列因此几乎处处是 1（`libc.so`），单独看没有信息量。列头 ⓘ 必须直接写这句，
  并给一个"排除 `libc.so`"的筛选开关——排除之后剩下的才是需要人看的 20 条。

### 3.2 入度 2,944：裸的"被依赖数"排序没有信息量

按被依赖数降序，前 15 名全是基础库：

| 被依赖数 | dest | 归属部件 |
| ---: | --- | --- |
| 2,944 | `system/lib/chipset-sdk-sp/libc++.so` | build_framework |
| 2,676 | `system/lib/libhilog.so` | hilog |
| 2,440 | `system/lib/chipset-sdk-sp/libsec_shared.z.so` | bounds_checking_function |
| 1,906 | `system/lib/chipset-sdk-sp/libutils.z.so` | c_utils |
| 1,393 | `system/lib/platformsdk/libipc_single.z.so` | ipc |
| 1,113 | `system/lib/chipset-sdk-sp/libclang_rt.ubsan_minimal.so` | build_framework |
| 803 | `system/lib/platformsdk/libace_napi.z.so` | napi |
| 683 | `system/lib/platformsdk/libuv.so` | libuv |
| 550 | `system/lib/chipset-sdk-sp/libsamgr_proxy.z.so` | samgr |

这 9 个（≥ 500）解释了 29,937 条边里的一大半。它们是**答案不是问题**，但把列表默认排成这样，
读者看到的就是一屏基础库，看不到任何部件信息。

展示要求：

- 被依赖数**分档**而不是给裸数字：`基础库 ≥1000` / `公共 ≥100` / `普通 <100` / `无直接依赖方 0`。
  档位是派生，ⓘ 里写清阈值。
- 默认排序仍是被依赖数降序（热点优先是有用的），但列表顶部给一条常驻 chips：
  `排除 9 个基础库（≥500）` —— 一键把它们收进一行摘要，让剩下的 3,511 行显出部件分布。
- 影响面（反向闭包）同理：max 3,384 = 96% 的镜像，**给百分比和分档，不给裸数字**；
  细节在档案抽屉里按距离分层（`libc++.so` 实测 1 跳 2,944 / 2 跳 414 / 3 跳 26，三层就说完了）。

### 3.3 同名遮蔽：14 个名字，其中 6 个的胜负是字典序定的

可命中池（`system/` + `vendor/`，3,363 个模块）里有 14 个 `file_name` 出现两次。
`resolution.py` 按 deps_guard 的 `(目录 rank, 原候选序号)` 取第一个，所以每对里**只有一份会被运行时加载**。

| file_name | 命中（rank · 入度 · 部件） | 被遮蔽（rank · 入度 · 部件） |
| --- | --- | --- |
| `libutils.z.so` | `system/lib/chipset-sdk-sp/` · 1000 · **1,906** · c_utils | `system/lib/module/arkts/` · 1000 · 0 · ets_utils |
| `libconfiguration.z.so` | `system/lib/platformsdk/` · 6 · 108 · ability_base | `system/lib/module/` · 9 · 0 · ace_engine |
| `libsms.z.so` | `system/lib/platformsdk/` · 6 · 3 · window_manager | `system/lib/module/telephony/` · 1000 · 0 · sms_mms |
| `libhid.z.so` | `system/lib/ndk/` · 3 · 0 · external_device_manager | `system/lib/module/bluetooth/` · 1000 · 0 · bluetooth |
| `liboverlay.z.so` | `system/lib/module/` · 9 · 0 · ace_engine | `system/lib/module/bundle/` · 1000 · 0 · bundle_framework |
| `libdeviceinfo.z.so` | `system/lib/module/` · 9 · 0 · init | `system/lib/module/enterprise/` · 1000 · 0 · enterprise_device_management |
| `libbluetoothmanager.z.so` | `system/lib/module/` · 9 · 0 · bluetooth | `system/lib/module/enterprise/` · 1000 · 0 · enterprise_device_management |
| `libusbmanager.z.so` | `system/lib/module/` · 9 · 0 · usb_manager | `system/lib/module/enterprise/` · 1000 · 0 · enterprise_device_management |
| `libwifimanager.z.so` | `system/lib/module/` · 9 · 0 · wifi | `system/lib/module/enterprise/` · 1000 · 0 · enterprise_device_management |
| `libbundlemanager.z.so` | `system/lib/module/bundle/` · **1000** · 0 · bundle_framework | `system/lib/module/enterprise/` · **1000** · 0 · enterprise_device_management |
| `libcommon.z.so` | `system/lib/module/bluetooth/` · **1000** · 0 · bluetooth | `system/lib/module/enterprise/` · **1000** · 0 · enterprise_device_management |
| `libconnection.z.so` | `system/lib/module/bluetooth/` · **1000** · 0 · bluetooth | `system/lib/module/net/` · **1000** · 0 · netmanager_base |
| `libsocket.z.so` | `system/lib/module/bluetooth/` · **1000** · 0 · bluetooth | `system/lib/module/net/` · **1000** · 0 · netstack |
| `libobserver.z.so` | `system/lib/module/arkui/` · **1000** · 0 · ace_engine | `system/lib/module/telephony/` · **1000** · 0 · state_registry |

两个必须讲清的点：

1. **加粗的 6 个是同 rank（都不在 deps_guard 的顺序表里，rank 记 1000），胜负由 `dest` 字典序决定。**
   这是扫描器的确定性约定，deps_guard 自身也这么取（`dep_elf[0]`），但**运行时 musl 的搜索顺序不保证如此**。
   界面上这 6 个要打一个单独的标记：`⚠ 同 rank，按路径序取`，不能和"rank 明确更小"的那 8 个混为一谈。
2. `libutils.z.so` 是最该被看见的一条：**1,906 条边指向 c_utils 那一份，ets_utils 的同名库入度 0**。
   这类"一个名字两个实现"是 install_targets 视角完全看不出来的信息，也是本域最值钱的产出。

展示要求：

- 一个独立的「同名遮蔽」清单（14 行，一屏放得下），入口在 `#/files/elf?only=shadowed`：
  名字 / 命中方 + rank + 入度 + 部件 / 被遮蔽方同上 / 胜负依据（rank 明确 or 路径序）。
- 列表里被遮蔽的那一份打 `⚠ 被遮蔽` 徽标（`type: 'bool'` + `trueText`，不只靠颜色，a11y 要求）。
- 另外 138 个"全镜像多份但不在可命中池"的名字（`ramdisk/` `updater/` 副本，如 3 份 `sh`、3 份 `libc++.so`）
  **不算遮蔽**，但档案页要给一行"镜像里还有 N 份同名文件"并列出路径——否则反查 `sh` 得到 3 条结果会让人以为出错了。

---

## 4. 落点：不新开一级菜单

### 4.1 导航与路由

| 位置 | 改动 |
| --- | --- |
| `#/files/elf` | 新增二级视图「ELF 模块」，与「安装目标」「镜像视图」并列 |
| `#/data/elf_modules` · `#/data/elf_module_dependencies` | 调测面各加一条（一个 3 行的 view + 一条 `TABLE_CONFIG`） |
| `#/e/elf_modules/<id>` | 已有通用档案页，登记 `entities.js` 后即工作 |

理由：ELF 是安装目标的子集（3,520 / 5,809），读者的心智是"镜像里这个文件"，放 `系统文件` 组下最连续。
不新开一级组——一级组是概念链三段（源码 → 镜像 → 运行），加第四段会破坏首页那张图（`views/Home.vue`）。
`#/files/elf` 与 `#/files/targets` 的关系写进 lede：*"5,809 个安装文件里，3,520 个是 ELF；这里只看这 3,520 个，以及它们之间的 33,367 条链接依赖。"*

### 4.2 首页与概念模型

`model/overview.js` 加三个计数（`elfModules` / `elfEdges` / `elfUnresolved`），`views/Home.vue` 的
「系统文件」段加一格 node（`ELF 模块 3,520 → /files/elf`）与一条 leaf（`33,367 条链接依赖 · 20 条真悬空`）。
概念链因此补上缺的一环：安装目标 → **ELF 模块 → 依赖边**，与 `docs/architecture/unified-model.md` §3.4 对齐。

### 4.3 `entities.js` 登记（顺带验证 ux-design §11 的扩展性承诺）

```js
elf_modules: {
  label: 'ELF 模块', icon: 'chip', accent: 'module', lenses: ['image'],
  title: r => r.dest, subtitle: r => r.soname || r.file_name,
  parent: 'component_id',          // 出边有 3 条（install_targets/install_modules/components），归属该看部件
},
elf_module_dependencies: {
  label: '依赖边', icon: 'node', accent: 'module',
  title: r => `${r.needed_name} → ${r.callee_dest || '(未命中)'}`,
  viaLabel: { caller_id: '我依赖的', callee_id: '依赖我的' },   // 新增字段，见下
},
```

**这里会撞到一个真实的框架缺口**：`elf_module_dependencies` 有两条外键都指向 `elf_modules`
（`caller_id` 与 `callee_id`），`metadata.js` 的 `incoming` 因此给出两条同表入边。
`EntityDossier.vue` 现在只用 `entityOf(table).label` 渲染关联行标题，结果是档案页出现
**两行都叫「记录 N 条」**、展开后标题都是数字 id——完全不可读。

修法（框架级，约 8 行，对所有域生效）：`relationsOf` 已经带了 `via`，`EntityDossier.vue` 的关联区
优先取 `entityOf(t).viaLabel?.[r.via]`，没有再退回 `label`；`titleOf` 用上面的 `title(r)`。
`relationsOf` 对 `elf_modules` 的两个入边计数恰好就是**出度与入度**，标签修对之后这一区立刻有用，不需要额外查询。

另外 `elf_modules` 没有 `record` 列（采集器只存物理事实），档案页的「原始声明 record」区会自动隐藏。
不要为它造假 record：把可追溯性放到依赖区末尾的一条**复核命令**上（§5.3）。

---

## 5. 三个表面

### 5.1 列表 `#/files/elf`

取数（`model/lists.js` 新增 `loadElfModules(scanId)`）：一条 JOIN 拿模块 + 部件 + 安装模块，
入度 / 未解析数用 **GROUP BY 聚合**取回，不要把 33,367 条边拉进列表路径：

```sql
WITH in_degree AS (
       SELECT callee_id AS id, COUNT(*) AS n FROM elf_module_dependencies
        WHERE scan_id = ? AND callee_id IS NOT NULL GROUP BY callee_id),
     unresolved_by AS (
       SELECT caller_id AS id, COUNT(*) AS n FROM elf_module_dependencies
        WHERE scan_id = ? AND resolution = 'unresolved' GROUP BY caller_id)
SELECT e.id, e.dest, e.partition, e.file_name, e.soname, e.format, e.type, e.machine,
       e.dynamic, e.needed, e.install_target_id, e.install_module_id,
       c.id AS component_id, c.name AS component, c.subsystem,
       m.label, m.type AS module_type,
       COALESCE(i.n, 0) AS dependents, COALESCE(u.n, 0) AS unresolved
  FROM elf_modules e
  LEFT JOIN components c ON c.id = e.component_id
  LEFT JOIN install_modules m ON m.id = e.install_module_id
  LEFT JOIN in_degree i ON i.id = e.id
  LEFT JOIN unresolved_by u ON u.id = e.id
 WHERE e.scan_id = ?
 ORDER BY dependents DESC
```

度数**必须**是这里的 GROUP BY 预聚合，不能挪回 SELECT 列表里当相关子查询——本节草稿原先
就是那么写的，实现照抄之后 `#/files/elf` 出第一行要 **7.9 s**：`unresolved` 那条的条件是
`(scan_id, caller_id, resolution)`，库里没有这个形状的索引，又没有 `sqlite_stat1`，
planner 于是挑了只有两个取值的 `(scan_id, resolution)`，3,520 × 3,430 ≈ 1,200 万次回表。
预聚合版 **81 ms**，结果逐行逐列一致。定位过程、量法、以及同一轮里查出的另两处
（子查询漏 `scan_id`、`el-popover` 默认 eager 渲染）见
[`list-query-performance.md`](./list-query-performance.md)。

3,520 行、两次聚合 + 四次 JOIN 在 sql.js 里是一次执行；**影响面（闭包）不进列表**——
单源 BFS 在 33k 边上是亚毫秒级（3,520 次全量正向 BFS 实测 0.3 s），所以放到抽屉打开时按需算一次（`model/elfgraph.js`）。
不要用递归 CTE 逐行查（3,520 次往返），也不要一次性预计算 3,520 个闭包。

列目录 `src/model/columns/elf.js`，`GROUPS = ['文件', 'ELF 事实', '依赖', '归属']`，18 列 / 默认显示 9 列：

| 组 | key | 列名 | type | 默认 | 要点（ⓘ 里要写的） |
| --- | --- | --- | --- | :-: | --- |
| 文件 | `dest` | 安装路径 | path | ✔ 主列 fixed | 与 `install_targets.dest` 一一对应 |
| 文件 | `file_name` | 文件名 | text | ✔ | 单独成列才能按名字排序 / 搜索 |
| 文件 | `partition` | 分区 | badge | ✔ | 只有 system / vendor 参与同名命中 |
| 文件 | `lib_rank` | 目录名次 | num | | deps_guard 库搜索顺序里的名次，**解释"为什么同名两份时命中的是这一份"**；不在顺序表里记 1000（需采集器落库，§7） |
| 文件 | `copies` | 同名副本 | num3 | | 全镜像里同名文件几份；152 个名字 > 1，最多 3 份 |
| 文件 | `shadowed` | 被遮蔽 | bool | | 可命中池内有同名且 rank 更靠后 → 运行时不加载它；14 个，其中 6 个是同 rank 按路径序 |
| ELF | `soname` | SONAME | text | | 232 个未声明（显示"未声明"不是空白）；5 个与文件名不同，正是反查查不到的原因 |
| ELF | `format` | 字长 | badge | | ELF32LE 3,516 / ELF64LE 4 |
| ELF | `machine` | 架构 | text | | 库里是数字，给译文：40 ARM / 183 AArch64 / 247 RISC-V |
| ELF | `elf_type` | ELF 类型 | text | | dyn / rel / exec，**必须写明 PIE 可执行文件也是 dyn** |
| ELF | `dynamic` | 有动态段 | bool3 | | 3 个没有（eBPF `.o` 之类），保留为元数据 |
| 依赖 | `needed` | 直接依赖 | num | ✔ | `needed[]` 长度；p50 8 / max 128 |
| 依赖 | `dependents` | 被依赖 | num | ✔ | 入度；**分档显示**（基础库 ≥1000 / 公共 ≥100 / 普通 / 0） |
| 依赖 | `unresolved` | 未解析 | num warn | ✔ | ⓘ 直接写"3,406 / 3,430 是 `libc.so`"，并给"排除 libc.so"开关 |
| 依赖 | `impact` | 影响面 | text | | 反向可达占比 + 分档（按需算，不进列表 SQL） |
| 归属 | `component` | 归属部件 | text link | ✔ | 324 / 382 个部件有 ELF 产物 |
| 归属 | `subsystem` | 子系统 | text | | |
| 归属 | `label` | 安装模块 | label link | | `GnLabel` 自带源码链接；3,373 个不同安装模块装出这 3,520 个 ELF |
| 归属 | `roles` | 运行时角色 | list | ✔ | 这个 ELF 是不是某服务的可执行文件（162/164）/ 某 SA 的 libpath（161/165）/ 某 HDI 的 library（46/46） |

分面与筛选：

- chips：分区（5）· 目录族（前 10 + 其它）
- 下拉：部件、子系统
- 开关：`只看被遮蔽`（14）· `只看有未解析（排除 libc.so）`（20 条边的调用方）· `只看入度 0`（2,199）· `排除基础库（≥500）`（9）
- 默认排序：被依赖数降序；状态全部进 URL（沿用 `useQueryState`）

性能：3,520 行必须分页（默认 100）。依据是实测：同一套 `EntityTable`，5,904 行不分页首屏 33 s、分页后 2.5 s
（`docs/nav-two-level-proposal.md` §2、§9.3）。3,520 行落在同一量级，不另做特殊处理。

### 5.2 展开行：1 跳清单（不对称是硬约束）

沿用运行视图的展开下钻（`el-table` expand），一行展开两块：

- **直接依赖（≤ 128 行，全列）**：序号 / `needed_name` / 命中的 `dest`（link）/ 命中方归属部件 / 目录 rank / `resolution` 徽标。
  未命中的行显示档位（SONAME 命中 / 镜像内没有），不是一片空白。
- **直接依赖方（≤ 2944 行，必须聚合）**：入度 ≤ 200 直接列表；> 200 按**部件**聚合成
  "来自 N 个部件的 M 个模块"，默认折叠，展开看前 50 条 + "还有 K 条"（照 `views/Image.vue` 的分批做法，不做虚拟滚动）。

出度 max 128、入度 max 2,944——这个 23 倍的不对称决定了"两边都列出来"是行不通的，
也是为什么不画图而用聚合表：`libc++.so` 的 2,944 条入边画成任何图都是毛球，聚合成"来自 296 个部件"才是一句话。

### 5.3 档案抽屉 / 整页 `#/e/elf_modules/<id>`

沿用 `EntityDossier` 的四区（身份 / 属性 / 关联 / 原始声明），本域只**新增一个「依赖」区**，放在属性之后、关联之前：

```
┌ system/lib/chipset-sdk-sp/libutils.z.so            [ELF 模块 · module] ┐
│ c_utils › //base/startup/...:libutils_shared › system/lib/chipset...   │  ← 结构面包屑（trailOf 自动）
│ 🔨 构建  部件 c_utils（startup）                          [前往 →]     │
│ 📦 镜像  由 install_target #1680 装入 · 目录名次 1000 · 同名 2 份 ⚠    │
│ ▶️ 运行  未被任何服务直接 exec；被 1,906 个模块链接        [前往 →]     │
├────────────────────────────────────────────────────────────────────────┤
│ 依赖                                                                   │
│  直接依赖 12            [表：needed_name / 命中 / 部件 / rank / 状态]   │
│  直接依赖方 1,906       按部件聚合：来自 N 个部件  ▸ 展开前 50          │
│  影响面     反向可达 2,913 个模块（83% 的镜像）· 涉及 268 个部件 · 最远 9 跳 │
│             1 跳 1,906 · 2 跳 780 · 3 跳 190 · …        [导出清单]     │
│  依赖了     正向可达 214 个模块 · 涉及 41 个部件（top 10 条形）          │
│  同名       ⚠ 遮蔽 system/lib/module/arkts/libutils.z.so（ets_utils）   │
│             同 rank，按路径序取——运行时不保证                          │
│  复核       readelf -d out/rk3568/packages/phone/system/lib/...        │
└────────────────────────────────────────────────────────────────────────┘
```

三条要求：

1. **影响面按距离分层**，不逐条列。实测分层很浅：`libc++.so` 反向可达 3,384 个只有 3 层
   （2,944 / 414 / 26），`libace_napi.z.so` 1,390 个分 8 层（803 / 466 / 71 / 22 / 15 / 7 / 2 / 4）。
   分层 + 部件聚合 + 导出按钮，比 3,384 行表格有用得多。
2. **三镜头的「运行」一格必须真接线**：`services.executable` / `sas.libpath` / `hdis.library` 三处命中
   （162/164、161/165、46/46），命中就给"宿主进程 X"，没命中就写"未被任何服务直接 exec"——
   后者也是事实，不留空。
3. **复核命令**替代 `record` 区。这个域没有"原始声明"，但有可复核的物理事实：
   给出 `readelf -d <workspace>/out/<product>/packages/phone/<dest>`，让人能自己验一遍 SONAME 与 `DT_NEEDED`。
   这与 `oskm/tests/verify_rk3568.py` 的 oracle 是同一条命令，"只陈述事实、可追溯"因此闭环。

### 5.4 反查（⌘K）加一级：SONAME

`model/lookup.js` 现在 6 级（dest → file_name → label → process → component → repo）。
在 `file_name` 之后插入 `soname`，并给命中结果补两条注解：

| 查询 | 现在的回答 | 加了 ELF 之后的回答 |
| --- | --- | --- |
| `libc.so` | 未匹配 | SONAME 命中 3 份 `ld-musl-arm.so.1`（system / ramdisk / updater）+ "镜像里没有名为 libc.so 的文件，musl 的 SONAME 由它提供"；运行时加载 `system/lib/ld-musl-arm.so.1` |
| `librga.so.2` | 未匹配 | SONAME 命中 `vendor/lib/passthrough/indirect/librga.z.so`（4 条边指向这个名字） |
| `libutils.z.so` | 文件名匹配 2 条，不分主次 | 2 条，标出哪一份被加载（chipset-sdk-sp · c_utils · 1,906 条边）、哪一份被遮蔽（module/arkts · ets_utils · 0 条边） |
| `sh` | 文件名匹配 3 条 | 3 条 + "ramdisk / updater 副本不参与同名命中" |

反查是测试集成的主入口（ux-design §6），崩溃栈里给的常常是 SONAME 而不是文件名——
这一级补上之后，"崩在 `libc.so` / `librga.so.2` 里"才查得到归属。

### 5.5 质量页：给 `ELF_PARSE_FAILED` 写人话

`model/issues.js` 目前没有这个码，会退到 §FAMILIES 的词尾兜底，读者只看到"ELF 解析失败 25 条"，
合理但错误的联想是"镜像里有 25 个坏文件"。实测这 25 条是：

| 条数 | 真实原因 | 例子 |
| ---: | --- | --- |
| 22 | **扫描进程没有读权限**（文件 mode 640 / 600） | `system/etc/passwd`、`system/etc/param/ohos.para` 等 20 条 640、2 条 600 |
| 1 | 清单里是文件、盘上是目录 | `system/etc/dmsfwk/resources` |
| 1 | 清单里有、盘上没有 | `eng_system/bin/su` |
| 1 | 超单文件字节预算 | `system/app/com.ohos.arkwebcore/ArkWebCore.hap`（147,926,063 B） |

按 issues.js 的三段式写：**是什么**（读不到或超预算，不是文件损坏）、
**为什么要管**（这 25 个文件因此不在 3,520 里，依赖图上有 25 个洞；其中 22 个洞是扫描环境造成的）、
**怎么办**（用有读权限的账号重扫可收敛 22 条；`.hap` 那条是预算设计使然，本就不该当 ELF 读；
目录与缺失那 2 条要对 `system_module_info.json` 核清单）。
等级维持 `advisory = 0`（扫描层）——它确实影响"数字能不能信"，但影响面是 25 / 5,809。

### 5.6 部件级「声明 vs 实测」（Phase 3，本域最高价值的产出）

把 25,163 条跨部件模块边投影到部件，得到**实测链接依赖图**，与 `components.deps` 的**声明依赖图**并列：

| | 有序部件对 |
| --- | ---: |
| 实测（ELF 边投影） | 4,826 |
| 声明（`deps.components`，指向本产品存在的部件） | 5,897（含悬空共 5,940） |
| 两者都有 | 4,361 |
| **仅声明、无实测边** | 1,536 |
| **仅实测、无声明** | 465 |

两个差集都能直接读出结论：

- **仅实测无声明 465 对里，296 对的被依赖方是 `build_framework`**（`libc++.so` / `libclang_rt.ubsan_minimal.so`，
  共 4,110 条模块边），90 对是 `bounds_checking_function`（`libsec_shared.z.so`）。
  即：**296 个部件在链接编译器运行时，却没在 bundle.json 里声明这个依赖。**
- **仅声明无实测 1,536 对里，416 对的被依赖方在镜像里没有任何 ELF 产物**
  （`json` / `node` / `taihe_ffi_gen` / `ets_frontend` / `idl_tool` —— 头文件库与构建期工具），
  另 1,120 对被依赖方有 ELF 但没有链接边（静态库、dlopen、或只在 ArkTS 层依赖）。

呈现：部件档案页的关联区加两行「实测链接依赖 N」「声明依赖 M」，并给三个差集 chips；
不新开视图（Phase 3 再决定要不要 `#/parts/deps`）。
**必须写清的口径**：ELF 边是链接期事实，声明是构建期意图，两者不等价；差集是线索不是结论。
这句话要出现在界面上，不只是文档里——否则 465 会被读成"465 个违规"。

---

## 6. 明确不做

| | 理由 |
| --- | --- |
| 全量依赖力导向图 | 3,520 节点 / 29,937 边 / 入度 max 2,944。ux-design §14 已按 382 节点 5,913 边否决过一次，这里规模大一个量级 |
| 逐条列出影响面 | max 3,384 行 = 96% 的镜像。分层 + 部件聚合 + 导出 |
| 在 viewer 里重算 deps_guard 目录 rank | 要把 `LIB64_DIRECTORY_ORDER`（36 项）与 `LIB_DIRECTORY_ORDER`（15 项）抄进 JS，deps_guard 改一次就静默失真（§7） |
| 符号级依赖 | 库里只有 `DT_NEEDED` / `DT_SONAME`，没有符号表 |
| 运行时实际加载序 | 需要 `/proc/<pid>/maps`。那是 SystemPulse 的 smaps 线，不在本库；本库只陈述"deps_guard 会加载哪一份" |
| treemap / 体积维度 | 库里没有文件体积（ux-design §14 同一条理由） |
| 循环依赖检测 UI | 实测 0 个非平凡 SCC，没有可展示的对象；等真有环再加 |

---

## 7. 需要采集器配合的一件事（不复制真相）

**`library_rank` 落库。** viewer 要解释"为什么同名两份时命中的是这一份"，就需要 rank，而 rank 的唯一权威是
`oskm/collectors/elf_modules/resolution.py` 的两张顺序表。

- 甲（推荐）：`elf_modules` 加两列 `library_rank INTEGER`、`copies INTEGER`（schema 2.0.0 → 2.1.0）。
  采集器在 `candidate_index()` / `reorder_library()` 里已经算过这两个值，落库约 5 行，
  `export_record` 带出来即可。顺带可以把"同 rank 按路径序"这个事实存成 `rank_tied INTEGER`，
  viewer 就不必自己判断。
- 乙：viewer 从 `dest` 重算。**否决**，理由是两处真相。

**unresolved 的 SONAME 档位不需要改采集器**：它是 `needed_name = 某个 elf_modules.soname` 的纯函数，
viewer 现算即可（一条 `SELECT soname, dest FROM elf_modules` 建索引），但 ⓘ 说明里要写明"由 viewer 按 SONAME 现算"。

可选（Phase 2）：采集器产出一条 advisory issue `ELF_SONAME_SHADOWED`（14 条，含"同 rank"标记），
比 viewer 现算更合适——rank 在它手里。若加，`model/issues.js` 同步写人话解释。

---

## 8. 改动清单与分期

| 文件 | 改什么 | 约行数 |
| --- | --- | ---: |
| `src/model/columns/elf.js` | 新增列目录（18 列，含 meaning / reading） | 170 |
| `src/model/columns/index.js` | `BY_TABLE` 加 `elf_modules`；`EXTRA` 加 `elf_module_dependencies` 的列 | 25 |
| `src/model/lists.js` | `loadElfModules(scanId)`（§5.1 的 SQL） | 45 |
| `src/model/elfgraph.js` | 新增：邻接缓存、入度分档、单源 BFS、遮蔽清单、SONAME 档位 | 110 |
| `src/views/list/Elfs.vue` | 新增列表视图（照 `list/Targets.vue`） | 90 |
| `src/components/DepPanel.vue` | 新增：档案页「依赖」区（1 跳表 + 分层影响面 + 遮蔽 + 复核命令） | 150 |
| `src/components/EntityDossier.vue` | 关联区用 `viaLabel` 区分同表双外键；本域插入 `DepPanel` | 20 |
| `src/model/entities.js` | 两个条目（§4.3） | 12 |
| `src/model/nav.js` | `PRODUCT_NAV` 子项、`DEBUG_ITEMS`、`VIEW_NAMES` | 6 |
| `src/router.js` | `/files/elf`、`/data/elf_modules`、`/data/elf_module_dependencies` | 6 |
| `src/views/ElfModuleList.vue` · `ElfEdgeList.vue` | 调测面两个 3 行壳 | 12 |
| `src/utils/columns.js` | 两条 `TABLE_CONFIG` | 30 |
| `src/model/lookup.js` | SONAME 一级 + 命中/遮蔽注解 | 30 |
| `src/model/issues.js` | `ELF_PARSE_FAILED` 三段解释 | 15 |
| `src/model/overview.js` · `src/views/Home.vue` | 三个计数 + 一格 node + 一条 leaf | 12 |
| `tools/table.mjs` · `tools/shoot.mjs` · `tools/smoke.mjs` · `selftest.py` | 断言与截图（§9） | 40 |

合计约 780 行，其中一半是列目录的 `meaning` / `reading` 文本——这部分不是样板，是本文 §3 的落地。

分期（每期独立可演示）：

| 期 | 内容 | 完成判据 |
| --- | --- | --- |
| **1** | 列表 `#/files/elf` + 档案登记 + `viaLabel` 修复 + 调测面两表 | 3,520 行分页首屏 < 2.5 s；抽屉里出入度显示正确、不再出现两行"记录" |
| **2** | `DepPanel`（1 跳 + 分层影响面 + 遮蔽）+ 反查 SONAME 一级 + 质量页解释 | 反查 `libc.so` / `librga.so.2` 有结果；`?only=shadowed` 出 14 行 |
| **3** | 部件级「声明 vs 实测」+ 采集器 `library_rank` 落库 | 部件档案能看到 465 / 1,536 两个差集，且界面上写了口径 |

Phase 1 不依赖采集器改动；`lib_rank` 列在 Phase 3 之前显示为"未采集"（三态，不报错）。

---

## 9. 验收断言

`tools/smoke.mjs`（新增，全部为实测值）：

```js
await go('#/files/elf');                 expect('ELF 列表计数', await text(), '3,520 个 ELF 模块')
                                  expect('默认按被依赖数降序', await firstRow(), 'libc++.so')
await go('#/files/elf?only=shadowed');   expect('同名遮蔽 14 行', await rowCount(), '14')
await go('#/files/elf?only=unresolved'); expect('排除 libc.so 后 20 条', await text(), '20')
await go('#/files/elf?detail=elf_modules/220')
                                  expect('影响面分层', await text(), '1 跳 1,906')
                                  expect('遮蔽提示', await text(), 'system/lib/module/arkts/libutils.z.so')
await go('#/files/elf?detail=elf_modules/169')
                                  expect('libc++ 影响面 96%', await text(), '3,384')
await go('#/lookup?q=libc.so');          expect('SONAME 一级命中', await text(), 'ld-musl-arm.so.1')
await go('#/lookup?q=librga.so.2');      expect('SONAME 命中 vendor', await text(), 'librga.z.so')
await go('#/findings?issue=elf_modules%2FELF_PARSE_FAILED')
                                  expect('25 条的真实原因', await text(), '没有读权限')
```

`selftest.py`（新增，纯 SQL，与浏览器无关）：

- `elf_module_dependencies` 行数 = `sum(json_array_length(elf_modules.needed))`（实测都是 33,367）
- 每条 resolved 边的 `callee_dest` 的 partition ∈ (`system`, `vendor`)
- 14 个遮蔽名的胜者与 `resolution.reorder_library` 一致；标出其中 6 个同 rank
- 单源 BFS 的影响面与 SQLite 递归 CTE 对拍（抽 20 个模块，含 `libc++.so` = 3,384）
- 反向闭包按距离分层之和 = 闭包总数（`libc++.so`：2,944 + 414 + 26 = 3,384）

`tools/table.mjs` 的六视图通用断言列表加第七个 `['/files/elf', 'ELF 模块']`（三态排序、导出=所见、0 与未声明可分辨）。
`tools/shoot.mjs` 加 `['files-elf', '#/files/elf', 1600, 900]`、`['elf-dossier', '#/files/elf?detail=elf_modules/220', 1600, 900]`、
`['elf-shadowed', '#/files/elf?only=shadowed', 1440, 900]`。
`npm run a11y`：`⚠ 被遮蔽` / `⚠ 同 rank` 必须带文字不只靠颜色；新增分档徽标复核对比度。
`npm run perf`：`#/files/elf` 首屏 < 2.5 s（与安装目标同基线）、单源 BFS < 50 ms、产品面首包 JS 仍 ≤ 180 KB gzip（不引第三方图库）。

---

## 10. 测量方法

本文每个数字都可以这样复现（库：`viewer/knowledge.db`，`scan_id = 1`）：

```bash
cd KnowledgeBase/packages/oskm
# 计数、分区、format、soname、resolution
sqlite3 viewer/knowledge.db "SELECT resolution, COUNT(*) FROM elf_module_dependencies WHERE scan_id=1 GROUP BY resolution"
# 入度 / 出度 / 未解析
sqlite3 viewer/knowledge.db "SELECT callee_id, COUNT(*) c FROM elf_module_dependencies WHERE scan_id=1 AND callee_id IS NOT NULL GROUP BY callee_id ORDER BY c DESC LIMIT 15"
```

闭包、SCC、遮蔽、部件投影用 Python 一次算完（3,520 节点 / 33,367 边，全量 < 1 s）：
把边读进 `defaultdict(list)` 建正反向邻接，单源 BFS 得距离分层，Tarjan 得 SCC（结果 0 个非平凡），
遮蔽清单直接调 `oskm.collectors.elf_modules.resolution` 的 `library_order` / `reorder_library`
（**不要在测量脚本里重抄顺序表**，否则测的不是采集器的口径）。
`ELF_PARSE_FAILED` 的 25 条真实原因，是拿 `issues.path` 回到 `code/out/rk3568/packages/phone/` 逐个 `stat` + `open` 得到的：
22 条 `PermissionError`（mode 640 / 600）、1 条 `IsADirectoryError`、1 条 `FileNotFoundError`、1 条超预算。
