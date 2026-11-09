# oskm Viewer URL 规范

日期：2026-10-19
版本：2.0
状态：**已实施**，与代码一致（回归由 `tools/nav.mjs` 守住）。

> v1.0 描述的是"每张表一个列表页"的 v2 结构，那套页面已整体下沉到 `/data/*`。
> 本版按 `docs/ux-design.md` 的四层结构与 `docs/navigation-options.md` 的导航方案重写。

## 1. 原则

1. **URL 即状态**：筛选、排序、展开、抽屉开在哪个实体，全在地址里。
   刷新恢复原样，链接贴给别人打开的是同一屏——目标读者包含测试集成人员，
   "把现场贴进缺陷单"是刚需。
2. **写状态用 `replace`，跳转用 `push`**。筛选不是"去了别处"，不该占一格历史。
   这一条是后退键能正确工作的根本，不是风格偏好。
3. **等于默认值的参数不写**。URL 保持短，也让"带了参数"本身有意义。
4. **Hash 路由**：`#/path?query`，静态文件直接打开，无需服务端。
5. **叶子浮抽屉，枢纽换整页**（见 §4）。

## 2. 路由总览

### 2.1 产品面

| URL | 页面 | 状态参数 |
| --- | --- | --- |
| `#/` | 首页：系统能干什么 | — |
| `#/runtime` | 运行视图 | `kind` `sort` `part` |
| `#/runtime/<id>` | 运行单元详情 | — |
| `#/build` | 构建视图 | `sub` `q` |
| `#/image` | 镜像视图（路径树） | `open` `q` |
| `#/lookup?q=` | 反查结果 | `q` |
| `#/findings` | 质量与治理 | `issue` |
| `#/e/<table>/<id>` | 实体档案（**所有实体共用一条路由**） | — |

### 2.2 调测面

| URL | 页面 |
| --- | --- |
| `#/data` → `#/data/components` | 默认表 |
| `#/data/<table>` | 原始表格浏览（repos / components / services / sas / hdis / install_modules / issues） |

### 2.3 兼容重定向

`#/<table>` → `#/data/<table>`；`#/install-modules` → `#/data/install_modules`；
`#/search?q=` → `#/lookup?q=`。

## 3. 参数字典

| 参数 | 出现在 | 取值 | 默认 |
| --- | --- | --- | --- |
| `scan` | **所有页面**（全局） | 扫描 id | 最新一次扫描 |
| `detail` | **所有页面**（全局） | `<table>/<id>` | 无，即不开抽屉 |
| `kind` | `/runtime` | `all` `sa` `hdf` `daemon` `unknown` | `all` |
| `sort` | `/runtime` | 见 `model/runtime.js` 的 `SORTS` | `contents` |
| `part` | `/runtime` | 部件名 | 空 |
| `sub` | `/build` | 子系统名 | 空 |
| `q` | `/build` `/image` `/lookup` | 关键字 | 空 |
| `open` | `/image` | 逗号分隔的目录路径 | 空（代码按最大分区默认展开两层） |
| `issue` | `/findings` | `<collector>/<code>` | 空 |

### 3.1 两个全局参数

`scan` 与 `detail` 不属于某个页面，跨路由都成立：

- **`scan`**：`router.push('/runtime')` 会丢掉整个 query，所以由
  `router.beforeEach` 从上一条 URL 继承。纯从 `from.query` 取，不依赖 store，
  因而没有初始化顺序问题。
- **`detail`**：抽屉可以浮在任何页面上，包括另一个档案页
  （在部件档案里点一条 innerapi，抽屉就浮在部件页上）。

### 3.2 `open` 的编码

只写**最深**的路径，祖先由前缀推导：`system/lib/module` 隐含 `system` 与 `system/lib`。
镜像树实测最深 6 层，这样 URL 增量不到 60 字符；全量写入展开几层就是几百字符的噪声。
编解码在 `composables/useQueryState.js` 的 `pathSet`。

## 4. 详情一律浮抽屉

`?detail=<table>/<id>` 是全局参数，任何页面都能带。点列表的一行、点档案里的
关联实体、点镜像树里的文件，都是浮出右侧抽屉，**不换页**。

> v2.0 这一节写的是"叶子浮抽屉、枢纽换整页"，按外键入边数分流。
> 已取消——分流让"什么时候浮、什么时候跳"变成要背的东西，而换页丢掉筛选、
> 排序、页码、滚动位置的代价对枢纽和叶子是一样的。
> 评估见 `detail-surface-assessment.md`。

`#/e/<table>/<id>` 整页保留，但只有两个用途：

- **深链接的落地页**（别人把链接贴给你，直接打开）
- 抽屉右上角「**在新页面打开 ↗**」的去处（打印、贴长链接、并排对比）

四条配套规矩，少一条统一形态就会变成退步：

| | 为什么 |
| --- | --- |
| 由 URL 驱动 | 可分享、刷新还在、后退键能关 |
| 能升级成整页 | 总有需要整页的时候，要留出口 |
| 不加遮罩、不锁焦点 | 左边的列表要保持可读、可点 |
| 点外面就关 | 它盖住右边小半屏，看完不关会一直挡着 |

两个例外不触发"点外面就关"：点**列表的另一行**（那一下该换内容），
以及点抽屉里弹出的下拉 / popover（它们渲染在 body 下，不在抽屉的 DOM 里）。

## 4.1 GN label 的源码链接

凡是展示 GN label 的地方（表格的"安装模块"列、档案页的属性），
label 旁边有一个 `↗`，指向定义它的 `BUILD.gn`：

```
仓的 remote_url + /tree/ + head_commit + / + 仓内相对路径 + /BUILD.gn
```

按**最长路径前缀**把 label 的目录匹配到 `repos.path`，实测 rk3568 的
5395 个 label 全部能定位到仓。用 `head_commit` 而不是 `revision`，
因为前者是扫描当时的确切状态，后者（`master`）会随时间漂移。

两条诚实边界，`title` 里写明了：目标**可能定义在 `.gni` 或被 import 的模板里**，
不一定在那个 `BUILD.gn` 中；URL 形态是**按惯例拼的**，没有联网验证过。
各托管站的拼法集中在 `model/gitlink.js` 的 `HOSTS` 表里，改一处即可。

## 5. 不进 URL 的状态

有意为之，不是遗漏：

| 状态 | 为什么不进 |
| --- | --- |
| 滚动位置 | 太碎、会让 URL 抖动。另用 `useScrollMemory` 按 `fullPath` 记在内存里 |
| 档案页关联区展开的是哪一节 | 纯浏览动作，换个实体就无意义 |
| `record` 原始声明是否展开 | 同上 |
| 主题（深/浅色） | 属于人而不属于页面，存 `localStorage` |

## 6. 面包屑

档案页顶部那条 `仓 › 部件 › 模块 › 当前` 不来自历史，而是**沿归属外键向上推导**
（`model/nav.js` 的 `trailOf`）。因此深链接直接打开也成立——这正是来路丢失最痛的场景。

出边有多条时按 `model/entities.js` 的 `parent` 声明消歧：
`sas`/`hdis`/`services` 的第一条出边是 `install_module_id`，但归属该看部件。
其余表的主链 `install_targets → install_modules → components → repos` 天然正确。

另有一个「← 返回<来源视图>」按钮，取自 `history.state.back`，没有来路时不显示。

## 7. 回归

`npm run nav`（`tools/nav.mjs`，33 条）守住本规范里有行为含义的部分：
筛选写进 URL、筛选不堆历史、后退后筛选与滚动位置都还在、叶子开抽屉且列表不动、
Esc 与后退键都能关抽屉、枢纽仍是整页、深链接直开有面包屑、`scan` 跨路由保持，
以及质量页的问题说明抽屉（`?issue=`）。

这些**构建期一条都测不出来**：语法全对，坏的是运行时行为。
