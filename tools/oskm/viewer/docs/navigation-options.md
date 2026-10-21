# 导航与上下文保持：问题分析与可选方案

日期：2026-10-19
版本：1.1
状态：**已实施**（三个阶段一次做完），实施记录见 §8。URL 契约见 `url-spec.md` v2.0。

针对"页面之间跳转后容易丢失当前路径信息"，以及"叶子级内容是否改用侧边栏"。
全部结论基于对当前代码与 `knowledge.db` 的实测，测量方法附在 §7。

---

## 1. 先把"丢失"拆开

"丢失路径信息"这一句话里其实压着三种不同的损失，成因不同、解法也不同，
混在一起谈会得出"加个面包屑就好了"这种只解决三分之一的结论。

| | 损失的是什么 | 用户感受 | 成因 |
| --- | --- | --- | --- |
| **L1** | **来路**：我是怎么到这儿的、这东西挂在哪 | 打开一个档案页，不知道它属于谁 | 无面包屑；`#/e/install_targets/4210` 地址本身不含上下文 |
| **L2** | **状态**：筛选、展开、滚动位置 | 返回后一切复位，得重做一遍 | 状态存在组件 `ref` 里，不在 URL；组件卸载即蒸发 |
| **L3** | **位置感**：我在整个结构的哪一层 | 不确定还能往回退几步 | 返回按钮是硬编码跳转，不是真"返回" |

L2 最刺痛（每次跳转都发生），L1 最隐蔽（深链接打开时才暴露），L3 最便宜（改几行）。

### 1.1 L2 的实测代价

```
运行视图：筛到「驱动宿主」(28 张卡) → 点进一张 → 浏览器后退
          → 回到 164 张，筛选没了
          筛选后的 URL： ?db=knowledge.db#/runtime   ← 不含任何筛选条件
```

7 个产品面视图里，只有 `Lookup` / `SearchResults` 把状态写进了 URL（`?q=`）。
其余全是组件内 `ref`：

| 视图 | 组件内状态 | 跳走再回来 |
| --- | --- | --- |
| `Runtime.vue` | kind / sort / component / q | 全丢 |
| `Build.vue` | subsystem / q | 全丢 |
| `Image.vue` | expanded(Set) / q | 树塌回默认两层 |
| `Findings.vue` | owner / 筛选 | 全丢 |
| `Entity.vue` | 展开的 record | 全丢 |

另外 `router.js` 里的 `scrollBehavior: () => ({ top: 0 })` **对这些视图根本不生效**：
滚动发生在 11 个组件内部的 `overflow: auto` 容器里，不是 window。
所以滚动位置既没保存，现有机制也救不回来——这条得单独处理。

### 1.2 这不是改设计，是补欠账

`docs/ux-design.md` §10 早已写明：

> `#/runtime` 运行视图（`?kind=&sort=&component=&partition=`）
> `#/build` （`?subsystem=&q=`） · `#/image` （`?path=system/lib`）
> **`?scan=` 始终作为全局参数**出现在每条 URL 上

实现时一条都没落地。所以 L2 的修复方向不需要论证，只需要选实现方式。

### 1.3 L3 的具体 bug

`RuntimeUnit.vue:42` 的「← 运行视图」用的是 `router.push('/runtime')`——
这是**往历史里再压一条**，不是返回。连点三次「进详情 → ←返回」，
浏览器后退键要按六次才出得去，且每次都落在丢了筛选的列表上。

---

## 2. 叶子与枢纽：一个客观的划分依据

是否该用侧边栏，取决于"这东西是终点还是中转站"。这个判断不必靠直觉，
外键图已经给出了答案——**入边数**（有多少张表指向我）就是客观指标：

| 表 | 出边 | 入边 | 性质 |
| --- | ---: | ---: | --- |
| `components` | 1 | **7** | 枢纽 |
| `install_modules` | 1 | **5** | 枢纽 |
| `services` | 2 | **2** | 枢纽 |
| `repos` | 0 | 1 | 中继 |
| `sas` / `hdis` | 3 | 0 | 叶子 |
| `install_targets` | 1 | 0 | 叶子 |
| `innerapis` / `syscaps` / `features` | 1 | 0 | 叶子 |
| `install_module_tags` / `issues` | 1/0 | 0 | 叶子 |

按行数：**枢纽 6572 行（38%），叶子 10650 行（62%）**。

而产品面最高频的两个点击，恰好都落在叶子上：
镜像树点一个文件（`install_targets`，5804 行）、运行单元里点一条 SA/HDI。

意义上也对得上：
- **枢纽**的价值是"从这儿继续往下走" → 走就该换页，换页是对的
- **叶子**的价值是"确认一个事实" → 确认完要回到原处，换页纯属损失

**关键是这个划分可以直接从 `metadata.js` 已有的 PRAGMA 外键图算出来，不写死表名。**
将来加采集器、加表，自动归类，与 §11「新增采集器时 viewer 不改核心代码」的原则一致。

### 2.1 侧边栏其实已经存在一半

`src/components/DetailSidebar.vue`（110 行）早就写好了，但是：

- 只接在**调测面**的 `TableView.vue:126` 上；产品面 9 处 `router.push('/e/...')` 没有一处用它
- 由 Pinia 的 `sidebarOpen` / `selectedEntity` 驱动，**不进 URL**——不可分享、刷新即丢、后退键关不掉
- 内置 `DETAIL_CONFIG` 硬编码每个表的字段，与后来写的 `entities.js` 显示清单重复

所以"改用侧边栏"的工作量不是从零开始，但也不是直接复用——需要把它从
Pinia 驱动改成 URL 驱动，并换成 `entities.js` + `metadata.js` 的通用渲染。

---

## 3. L2 可选方案：状态存哪

### 方案 1A：URL 即状态

筛选、排序、展开、关键字全部写进 query；写入用 `router.replace`（不污染历史），
跳转用 `push`。这一条区分是让后退键正确工作的关键。

```
#/runtime?kind=driver&sort=contents&part=foundation
#/image?open=system/lib64&q=camera
```

- **优点**：可分享、可书签、刷新不丢、后退天然正确、零内存开销、与已有 `?q=` 一致、
  无头测试可直接对 URL 断言
- **缺点**：每个视图要写同步代码（预计 10–15 行/视图）；展开集合若全量写入会让 URL 很长
- **长 URL 的处理**：树展开只存**最深路径**，祖先由代码推导（`a/b/c` 隐含展开 `a`、`a/b`），
  5804 个文件的树实测最深 6 层，URL 增量 < 60 字符
- **已验证无冲突**：`?db=` 在 `location.search`，路由 query 在 hash 之后，互不干扰

**对"测试集成人员"这个既定目标读者，可分享是刚需**——他们要把一个现场链接贴进缺陷单。
这一点是 1A 相对其它方案的决定性优势。

### 方案 1B：`<keep-alive>` 缓存组件实例

```vue
<router-view v-slot="{ Component }">
  <keep-alive :include="['Runtime','Build','Image']"><component :is="Component" /></keep-alive>
</router-view>
```

- **优点**：几行就能全保住，连滚动位置都不用额外处理；各视图零改动
- **缺点**：状态**不可分享、不在 URL、刷新即丢**；视图实例常驻内存
  （镜像视图那棵 5804 文件的树 computed 会一直挂着）；
  `watch(..., {immediate:true})` 在缓存场景下只在首次挂载跑，切换扫描的刷新路径要改走 `onActivated`，
  是本项目已经踩过两次的坑类型
- **定位**：它解决的是 L2 中的"状态"，但绕过了 URL，与 §10 已定原则冲突

### 方案 1C：Pinia 存各视图状态

等于手写一遍 keep-alive，代码更多，依然不在 URL。无明显优势，**不推荐**。

### 方案 1D：1A + 滚动位置单独恢复

因为滚动容器在组件内部，`scrollBehavior` 帮不上忙，必须自己存：
离开时按 `fullPath` 把容器 `scrollTop` 写进 `sessionStorage`，挂载后恢复。
约 20 行的一个 `useScrollMemory(el)` composable，各视图一行接入。

### 选型

**1A 作为主干，1D 补滚动。** 1B 可以作为 1A 的叠加项（二者不冲突：URL 管可分享的语义状态，
keep-alive 管纯渲染开销），但不应**替代** 1A——否则就把已经写进设计的"URL 即状态"又丢了。

---

## 4. L3 可选方案：叶子详情怎么展示

### 方案 3A：全页档案（现状）

整页替换。上下文 100% 丢失。保留它作为枢纽的展示方式是对的，作为叶子的则不是。

### 方案 3B：侧边抽屉（用户提出的方向）

点叶子 → 右侧 420–520px 抽屉浮出，列表保持原位、原滚动、原筛选；
Esc 或点外部关闭，回到原处；地址写成 `#/image?open=system/lib64&detail=install_targets/4210`。

- **优点**：**不跳转就不会丢**——对本问题是最直接的解法，L1/L2/L3 同时消解；
  可连续点多个文件对比；配合 1A 依然可分享（抽屉状态也在 URL 里）
- **缺点**：宽度有限，字段多的档案要滚动；窄屏需退化为全屏抽屉
- **已有基础**：`DetailSidebar.vue` 可改造（见 §2.1）

### 方案 3C：固定双栏 master-detail

左列表右详情常驻。

- **优点**：连续扫读对比最快，不需要开关动作
- **缺点**：列表被永久压窄——运行视图是卡片网格，压到 50% 会塌版；
  未选中时右半屏长期空置；对 `Image` 的树合适，对 `Runtime` 的卡片不合适
- **定位**：可作为镜像视图的**局部**布局，不宜做全局规则

### 方案 3D：按叶子/枢纽分流（推荐）

用 §2 的外键入边数决定：

| | 跳转方式 | 理由 |
| --- | --- | --- |
| 入边 = 0（叶子，62% 的行） | **抽屉** | 看完要回原处 |
| 入边 ≥ 1（枢纽） | **全页档案** | 要从这儿继续走 |

抽屉右上角给一个「在新页面打开 ↗」，把叶子升级成全页（深链接、打印、贴链接时需要）。
判定从 PRAGMA 外键图实时计算，新增表自动归类，无需维护名单。

---

## 5. L1 可选方案：面包屑

### 方案 2A：结构面包屑（从数据推导）

沿外键出边向上追溯：
`install_targets#4210` → `install_modules` → `components` →

```
多媒体  ›  camera_framework  ›  /system/lib64/libcamera.z.so
```

- **优点**：深链接直接打开也有上下文（这正是 L1 最痛的场景）；
  用 `metadata.js` 已有的外键图通用实现，**不需要每个域写代码**
- **缺点**：反映的是数据结构，不是"你刚才从运行视图来的"

### 方案 2B：轨迹面包屑（历史足迹）

用 `history.state` 记来路。真实反映路径，但刷新丢、分享给别人为空、
容易堆出「运行视图 › 档案 › 档案 › 档案」的噪声。

### 方案 2C：2A + 一个「← 返回<来源视图>」按钮

结构面包屑常驻（永远正确），来源按钮在 `history.state` 有来路时才出现。
同时把 `RuntimeUnit.vue` 的假返回改成真返回。

**推荐 2C，但 2A 先行**——2A 通用、零维护、深链接也成立；2B 部分是锦上添花。

---

## 6. 推荐组合与分期

| 阶段 | 内容 | 解决 | 预估 |
| --- | --- | --- | --- |
| **一** | 1A URL 即状态（5 视图）+ 全局 `?scan=` + 1D 滚动记忆 + 修 `RuntimeUnit` 假返回 | L2、L3 | ~150 行 |
| **二** | 3D 叶子分流抽屉：改造 `DetailSidebar` 为 URL 驱动 + 通用渲染 | L1、L2、L3 | ~180 行，净删 `DETAIL_CONFIG` |
| **三** | 2A 结构面包屑（通用）+ 2C 来源按钮 | L1 | ~80 行 |

三个阶段互不阻塞，可独立验收。阶段一单独做完就能消掉最刺痛的那部分。

配套在 `tools/` 加 `nav.mjs` 回归断言，并入 `npm run verify`：
筛选后 URL 含条件、后退后张数不变、抽屉 Esc 可关且回到原滚动位置、深链接直开有面包屑。
（`menu.mjs` 的经验：这类交互 bug 必须用真实指针移动与真实后退来测，
`page.goto` 是测不出来的。）

同时需要把 `docs/url-spec.md` 从 v2 的 8 表格路由规范刷新为本方案的 URL 契约——
它目前仍描述着已经下沉到 `/data/*` 的旧结构。

---

## 7. 测量方法

- **状态丢失**：playwright 操作筛选 → 记录卡片数与 URL → `page.goBack()` → 再记录
- **叶子/枢纽**：对每张表取 `PRAGMA foreign_key_list`，排除指向 `scans` 的扫描外键，
  统计入边数；行数取自 `knowledge.db`
- **滚动容器**：`grep -l "overflow: auto" src/views src/components`，确认 11 处在组件内部


---

## 8. 实施记录（2026-10-19）

三个阶段一并落地，选的就是 §6 的推荐组合：1A + 1D + 3D + 2A/2C。

### 8.1 新增与删除

| | 文件 | 说明 |
| --- | --- | --- |
| 新 | `composables/useQueryState.js` | query 参数当 ref 用；写 `replace`、等于默认值就删参数 |
| 新 | `composables/useScrollMemory.js` | 按 `fullPath` 记容器滚动位置 |
| 新 | `components/EntityDossier.vue` | 档案内容本体，整页与抽屉共用 |
| 新 | `components/DetailDrawer.vue` | URL 驱动的叶子抽屉 |
| 删 | `components/DetailSidebar.vue` + `PropTable.vue` + `RecordViewer.vue` | v2 遗留：Pinia 驱动、硬编码 `DETAIL_CONFIG`、模板里每渲染一次就查一次库 |
| 改 | `model/nav.js` | `isLeaf` / `openEntity` / `closeDetail` / `goBackTo` / `cameFrom` / `trailOf` |
| 改 | `views/Entity.vue` | 从 271 行缩成 38 行的外壳 |

`stores/viewer.js` 里的 `selectedEntity` / `sidebarOpen` / `selectEntity` / `closeSidebar`
一并删除——抽屉状态搬进了 URL，store 不再需要知道这件事。

### 8.2 实施中查出来的、分析阶段没料到的事

**`onBeforeUnmount` 里读 `route.fullPath` 读到的是新路由。**
滚动位置因此被存进了下一个页面的键里，Build 和 Entity 互相覆盖，实测
900 被对方的 136 冲掉。正确的存档时机是 `watch(() => route.fullPath)`
——pre-flush，元素还在、键还对。`useScrollMemory` 里有注释钉住这一点。

**测试本身会制造假象。** `locator.click()` 为了点到元素会自动把列表滚回顶部，
于是"点第一张卡片"这个写法自己把滚动位置清零，测出一个不存在的 bug。
必须点此刻就在视野里的元素。同理 `.file` 选择器会命中顶栏里那个隐藏的
"打开本地 .db 文件" label，得限定 `.tree .file`。

**`?scan=` 不能靠 store 推。** 做成 `router.beforeEach` 从 `from.query` 继承，
纯函数、无初始化顺序问题；靠 store 写则要处理"库还没加载完"的窗口。

**抽屉需要选中态。** 分析里把"连着点多个文件对比"当成抽屉的卖点，
但树里不高亮当前项的话这个场景根本用不了——补了 `.file.on`。

**面包屑会出现 `accessibility › accessibility`。** 仓和部件常常同名，
连续同名的那一级折掉。

### 8.3 回归

`tools/nav.mjs`，33 条，已并入 `npm run verify`（现为七项：
smoke / menu / nav / a11y 暗 / a11y 浅 / perf / shoot）。
抽屉作为新的一层表面，也加进了 a11y 与截图的取样点。

### 8.4 没做的

- `<keep-alive>` 没加。URL 已经承载了全部语义状态，再加一层缓存只省重建开销，
  但会引入"缓存里的数据过期"这类问题。等性能真成为瓶颈再说。
- 固定双栏（方案 3C）没做。镜像树适合，运行视图的卡片网格压到 50% 会塌版，
  不值得为一个视图引入第二套布局规则。
