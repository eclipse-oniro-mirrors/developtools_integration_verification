# oskm Viewer 实施计划

日期：2026-10-19  
版本：**3.1**（Phase 0–5 已实施，见 §14）  
依据：[UX 设计 v3.1](./ux-design.md)、[备选方案与选型理由](./ux-options.md)、[URL 规范](./url-spec.md)（需按 ux-design §10 修订）  
前身：v2.0（表格驱动）已被 ux-design v3.1 替换；其产出**不废弃**，整体转为"调测面"（见 §1）。

---

## 1. 定位：两个表面，两套标准

| | **产品面**（Product surface） | **调测面**（Debug surface） |
| --- | --- | --- |
| 页面 | 首页 · 运行 · 构建 · 镜像 · 档案 · 反查 · 质量 | `#/data` 原始表 / SQL / 表结构 |
| 读者 | 系统开发者、测试集成 | oskm 自身开发者 |
| 设计标准 | **本文全部标准适用**：设计系统、可访问性、性能预算、动效 | 够用即可，**刻意不投入设计预算** |
| 视觉语言 | 自建 token + 自建基元，有辨识度 | 通用管理后台外观即可 |
| 组件来源 | 自建（§3） | **Element Plus**（已有产出直接复用） |
| 包体预算 | 严格（§5） | 不计入产品面预算，**按路由懒加载** |

这条分界线同时解决了一个现实问题：当前 `main.js` 全量引入 Element Plus
（实测 **920 KB JS + 364 KB CSS**，占 JS 产物约 85%），而它提供的是表格、分页、输入框——
正是调测面需要、产品面不需要的东西。**把它关进调测面，产品面另起炉灶**，
既不浪费已有工作，也不让产品面背上一个通用后台的视觉语言。

> 判据：产品面任一路由的 JS chunk **不得**出现 `element-plus`。由构建脚本断言（§10）。

---

## 2. 设计系统（Phase 0，所有页面的前提）

全部以 CSS 自定义属性落在 `src/styles/tokens.css`。**产品面禁止出现硬编码颜色/间距**，由 stylelint 拦截（§10）。

### 2.1 颜色

暗色优先（沿用现有基调，取自 GitHub Primer dark-dimmed，对比度已验证）。

```css
/* 表面 */
--surface-sunken:  #1c2128;   /* 页面底 */
--surface-default: #22272e;   /* 内容区 */
--surface-raised:  #2d333b;   /* 卡片 */
--surface-overlay: #373e47;   /* 浮层、tooltip */

/* 描边 */
--border-subtle:   #2d333b;
--border-default:  #444c56;
--border-strong:   #768390;

/* 文本 */
--text-primary:    #adbac7;   /* 对 surface-default 对比度 8.2:1 */
--text-secondary:  #768390;   /* 4.6:1，仅用于 ≥13px */
--text-disabled:   #545d68;   /* 仅用于非信息性元素 */
```

**实体强调色与严重度色必须可区分**——当前设计有两处撞色，Phase 0 必须修掉：

| | 现状 | 问题 | 处置 |
| --- | --- | --- | --- |
| component | `#4ea8ff` | 与 info 同色 | 实体色**只做图标与 2px 左边条**，不做填充 |
| hdi | `#e0ab3a` | 与 warning 同色 | 同上；严重度**独占填充与徽标** |

```css
/* 实体强调（低饱和使用：图标、左边条、链接下划线） */
--entity-repo:      #768390;
--entity-component: #4ea8ff;
--entity-service:   #39c5cf;
--entity-sa:        #57c588;
--entity-hdi:       #e0ab3a;
--entity-module:    #c099ff;

/* 严重度（高饱和使用：徽标填充、计数背景） */
--severity-error:    #f47067;
--severity-warning:  #e0ab3a;
--severity-info:     #4ea8ff;
--severity-advisory: #768390;
```

**颜色不得是唯一信息载体**：`⚠ 混装` 必须同时有图标 + 文字；实体类型必须同时有图标 + 文字标签。

### 2.2 排版

```css
--font-ui:   ui-sans-serif, system-ui, -apple-system, "Segoe UI", "PingFang SC",
             "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
--font-mono: ui-monospace, SFMono-Regular, "SF Mono", Menlo, Consolas,
             "Liberation Mono", monospace;
```

**等宽字体是本工具的一等公民**，不是装饰。以下内容**必须**用 `--font-mono`：
镜像路径、GN label、`.so` 文件名、cfg 路径、JSON 原文、SA id、JSON Pointer。
理由：这些是用户要逐字比对、复制、粘贴进命令行的东西，比例字体会让 `l/1/I`、`O/0` 难以分辨。

| token | size / line-height | 用途 |
| --- | --- | --- |
| `--text-xs` | 11 / 16 | 徽标、表格密集模式 |
| `--text-sm` | 12 / 18 | 次要说明、属性名 |
| `--text-base` | 13 / 20 | 正文、表格、卡片内容 |
| `--text-md` | 14 / 22 | 卡片标题 |
| `--text-lg` | 16 / 24 | 区块标题 |
| `--text-xl` | 20 / 28 | 页面标题 |
| `--text-2xl` | 28 / 36 | 首页主标题 |

零 webfont 下载——本工具需离线可用。

### 2.3 间距、圆角、层级

```css
/* 4px 基准 */
--space-1: 4px;  --space-2: 8px;   --space-3: 12px;  --space-4: 16px;
--space-5: 24px; --space-6: 32px;  --space-7: 48px;  --space-8: 64px;

--radius-sm: 4px;    /* 控件 */
--radius-md: 6px;    /* 卡片 */
--radius-lg: 10px;   /* 面板、浮层 */
--radius-full: 999px;/* 胶囊徽标 */

--shadow-1: 0 1px 2px rgb(0 0 0 / .3);
--shadow-2: 0 4px 12px rgb(0 0 0 / .35);
--shadow-3: 0 12px 32px rgb(0 0 0 / .45);

--z-sticky: 100; --z-dropdown: 200; --z-overlay: 300; --z-toast: 400;
```

### 2.4 动效

```css
--motion-fast: 120ms;  /* hover / focus / 颜色 */
--motion-base: 180ms;  /* 进出场 */
--motion-slow: 240ms;  /* 布局位移、展开折叠 */
--ease-standard: cubic-bezier(.2, 0, 0, 1);
--ease-decelerate: cubic-bezier(0, 0, 0, 1);
```

规则：**动效只用于解释变化**（展开/折叠、视角切换的方向感、反查结果逐级揭示），
不用于装饰。不做入场动画、不做 loading 旋转以外的 spinner 特效。

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after { animation-duration: .01ms !important;
                           transition-duration: .01ms !important; }
}
```

### 2.5 密度

两档，由 `data-density` 属性切换：`comfortable`（产品面默认）、`compact`（调测面默认、产品面可选）。
行高分别 36px / 28px，内边距 `--space-3` / `--space-2`。

---

## 3. 组件清单

### 3.1 基元（`src/ui/`，产品面专用，零外部 UI 依赖）

| 组件 | 要点 |
| --- | --- |
| `Button` | variant: primary / secondary / ghost / danger；size: sm / md；loading 态 |
| `IconButton` | 必须有 `aria-label` |
| `TextField` | 含 `SearchField`（带清除、⌘K 聚焦） |
| `Select` / `MultiSelect` | 用于分面筛选，键盘可操作 |
| `SegmentedControl` | 视角切换、运行视图的 kind 过滤 |
| `Badge` | 计数；`Tag` 实体类型/严重度（图标 + 文字） |
| `Card` | 产品面主要容器，hover 抬升 `--shadow-1` → `--shadow-2` |
| `Panel` | 可折叠区块，记忆展开态到 URL |
| `Tooltip` / `Popover` | 延迟 300ms，键盘可触发 |
| `Skeleton` | 加载占位，**不用 spinner 填满页面** |
| `EmptyState` | 图标 + 一句话 + 一个行动按钮（见 ux-design §15） |
| `Toast` | 仅用于"已复制""文件加载失败" |
| `VirtualList` | **>200 行强制使用**（镜像 5804、模块 5501） |
| `DataGrid` | 产品面轻量表格（档案页关联区用），≠ 调测面的 EP 表格 |
| `CodeBlock` | JSON / cfg 原文，等宽 + 行号 + 一键复制 |
| `PathChip` | **高频组件**：等宽、可点、**中间省略**（`system/.../libfoo.z.so`）、hover 显示全路径、点击复制 |

`PathChip` 的中间省略不可用 `text-overflow: ellipsis`（会砍掉文件名，而文件名是关键信息）——
需按字符数从中间截断，保留首段与完整末段。

### 3.2 领域组件（`src/components/`）

| 组件 | 对应设计 | 要点 |
| --- | --- | --- |
| `ConceptMap` | ux-design §3.2 | 内联 SVG，节点可点进视角；未加载 db 时显示静态计数占位 |
| `CapabilityCard` | §3.3 | 任务一句话 + 真实例子 + 入口 |
| `ScanSummaryBar` | §3.4 | 窄条，不抢戏 |
| `RuntimeUnitCard` | §4.2 | 三行固定结构；`⚠ 混装` 徽标 |
| `LensSummary` | §5 | 三镜头摘要条，缺失镜头灰显"—" |
| `OwnershipChain` | §6 | 反查结果的归属链，逐级缩进 |
| `EntityHeader` | §5 | 标题 + 类型 Tag + 副标题 |
| `RelationGroup` | §5、§11 | **由 FK 元数据自动生成**，不逐域写 |
| `EgoGraph` | §5 | 1 跳有向图，SVG 径向布局 |
| `PathTree` | §7 | 镜像路径树，334 目录 / 深 6；虚拟化 |
| `FindingRow` | §8 | 条目 + 计数 + 趋势位 |

---

## 4. 技术决策

| # | 决策 | 理由 |
| --- | --- | --- |
| 1 | **Element Plus 仅限调测面，按路由懒加载** | 实测 920 KB JS + 364 KB CSS；产品面只需约 14 个基元，自建更小且有辨识度。从 `main.js` 移除全局 import 与全局 CSS，改为 `#/data` 路由内局部引入 |
| 2 | **不引入第二个 UI 组件库** | 产品面的核心界面（概念图、三镜头条、运行卡、归属链）都是定制的，通用库只会增加约束 |
| 3 | **自建 `VirtualList`（约 120 行）** | 只需固定行高的单列虚拟化；引第三方库不划算 |
| 4 | **ego 图手写 SVG 径向布局，不引 d3-force** | 只做 1 跳、节点数可控（最坏 260），径向布局比力导向**可预测、可复现、无抖动**；d3-force 约 30 KB 且结果不稳定 |
| 5 | **图标用内联 SVG sprite** | 不用图标字体（FOIT、不可访问）、不用 `@element-plus/icons-vue`（产品面） |
| 6 | **字体用系统栈，零下载** | 离线可用是硬需求 |
| 7 | **db 缓存进 IndexedDB** | 实测 **8.9 MB**；首次打开后缓存 ArrayBuffer + 文件指纹，二次进入免重选文件 |
| 8 | **sql.js WASM 与首页并行加载** | 672 KB；首页不依赖 db，不应被 WASM 阻塞 |
| 9 | 保持 hash 路由、纯静态 | 单个 `.db` + 一个目录即可分享 |
| 10 | **浅色主题延后**（Phase 8） | 先把暗色做到位；token 结构已预留，届时只换一组变量 |

---

## 5. 性能预算

实测基线：db **8.9 MB**、WASM **672 KB**、当前 JS 产物 **1.05 MB**（EP 920 K + vue 112 K + 应用 20 K）、CSS **364 KB**。

| 指标 | 预算 | 测法 |
| --- | --- | --- |
| 产品面首包 JS（gzip，不含 WASM） | **≤ 180 KB** | 构建报告断言 |
| 产品面 CSS（gzip） | **≤ 40 KB** | 同上 |
| 调测面 chunk | 不限，但**必须懒加载** | 构建断言：`#/data` 之外的 chunk 不含 element-plus |
| 首页 LCP（未加载 db） | **< 1.0 s** | Lighthouse，节流 4×CPU |
| 打开 .db → 可交互（首次） | **< 3 s** | 手测 + 埋点 |
| 二次进入（IndexedDB 命中） | **< 800 ms** | 同上 |
| 列表筛选/排序响应 | **< 100 ms** | 内存 SQL，5804 行可达 |
| 任意列表滚动 | **60 fps** | >200 行必须虚拟化 |
| 运行视图 164 张卡片首屏 | **< 1 s** | ux-design §13 阶段 1 判据 |

超预算即视为缺陷，不接受"先上线再优化"。

---

## 6. 可访问性（WCAG 2.1 AA）

| 项 | 要求 |
| --- | --- |
| 对比度 | 正文 ≥ 4.5:1，大字/图形/边框 ≥ 3:1。token 已按此选定，新增颜色需复核 |
| 键盘 | 全部功能可达；`⌘K`/`Ctrl K` 聚焦反查条；`Esc` 关闭浮层；树支持方向键 |
| 焦点 | `:focus-visible` 2px 外环 + 2px 偏移，**不得移除** outline |
| 语义 | 表格 `<table>` + `scope`；树 `role="tree"`；折叠区 `aria-expanded`；图标按钮 `aria-label` |
| 非颜色编码 | 严重度与"混装"必须带图标或文字 |
| 动效 | 尊重 `prefers-reduced-motion` |
| 缩放 | 400% 缩放下无横向滚动、无内容截断 |
| 语言 | `<html lang="zh-CN">` |

自动检查：CI 跑 axe-core；人工检查：每阶段用键盘走完一遍主流程。

---

## 7. 响应式与断点

| 断点 | 首页 | 运行视图 | 档案页 | 调测面 |
| --- | --- | --- | --- | --- |
| ≥1280 | 概念图横版、能力卡 2×2 | 卡片两列 | 三镜头横排、关联两列 | 左右分栏 |
| 1024–1279 | 同上，卡片间距收紧 | 卡片两列 | 三镜头横排、关联单列 | 左右分栏 |
| 768–1023 | 概念图横版、能力卡 1×4 | 卡片单列 | 三镜头横排 | 上下堆叠 |
| <768 | 概念图竖排、卡片堆叠 | 卡片单列、内容行折叠 | 三镜头竖排 | 仅只读表格 |

调测面不保证 <768 的体验（目标读者在桌面）。

---

## 8. 分阶段实施

每阶段**独立可演示**，结束时必须通过 §5 预算与 §6 检查。

### Phase 0 · 设计系统与骨架（基础，不可跳过）

- `src/styles/tokens.css`（§2 全部 token）+ `reset.css`
- `src/ui/` 14 个基元，含 Storybook 式的 `#/dev/ui` 预览页（仅开发构建）
- 从 `main.js` 移除 Element Plus 全局 import，改为 `#/data` 路由内引入
- stylelint 规则：产品面禁止硬编码颜色/间距
- **判据**：`#/dev/ui` 可见全部基元；构建产物中产品面 chunk 不含 element-plus；CSS gzip ≤ 40 KB

### Phase 1 · 运行视图（ux-design §4）

- `RuntimeUnitCard` + 筛选/排序 + 运行单元档案
- **判据**：一眼看出 13 个混装单元（10 个 SA 宿主 + 3 个驱动宿主）；164 张卡片 < 1 s；键盘可完成筛选→选卡→进档案

### Phase 2 · 首页（ux-design §3）

- `ConceptMap`（SVG，节点可点）+ 4 张 `CapabilityCard` + `ScanSummaryBar`
- **判据**：未加载 .db 也能完整阅读；加载后数字自动填充；LCP < 1 s

> Phase 1+2 构成可演示的最小闭环：**能讲清是什么 + 能看一个真问题**。此时交付给开发者与测试集成各 1~2 人试用。

### Phase 3 · 反查条（ux-design §6）

- 顶栏常驻、`⌘K` 聚焦、6 级回退识别、`OwnershipChain` 结果
- **判据**：粘贴一个 `.so` 名得到完整归属链；无结果时给出 6 类可识别线索

### Phase 4 · 实体档案页 + FK 自动关联（ux-design §5、§11）

- 通用模板 + `LensSummary` + `RelationGroup`（由 `PRAGMA foreign_key_list` 驱动）+ `EgoGraph`
- **判据**：6 类实体均可用；**新建一张表不改代码也能打开**；hilog（入度 260）展开不掉帧

### Phase 5 · 调测面收拢（ux-design §9）

- 现有 8 个 `*List.vue` + `TableView` 迁到 `#/data/<table>`，保留 Element Plus
- 补扫描元信息、自由 SQL、表结构三块；表清单由 `collector_runs` + `sqlite_master` 动态生成
- **判据**：14 张表全部可浏览；新增采集器后无需改代码即出现在列表

### Phase 6 · 构建视图（ux-design §7）

- 子系统分面（`thirdparty` 110 个可折叠、24 个单部件子系统合并为"其它"）+ 部件卡片

### Phase 7 · 镜像视图（ux-design §7）

- `PathTree`：334 目录 / 最大深度 6 / 5804 文件，虚拟化
- **判据**：任一文件三次点击内定位到归属部件

### Phase 8 · 质量与治理页 + 浅色主题（ux-design §8）

- `findings.js` 驱动的条目；趋势位预留
- 浅色主题：只替换 token 值，组件零改动（验证 token 抽象是否成立）

---

## 9. 文件结构

```
src/
├── styles/
│   ├── tokens.css          # §2 全部设计 token
│   ├── reset.css
│   └── main.css            # 布局骨架
├── ui/                     # 14 个基元，零业务、零外部 UI 依赖
│   ├── Button.vue  TextField.vue  Tag.vue  Card.vue  Panel.vue
│   ├── VirtualList.vue  DataGrid.vue  CodeBlock.vue  PathChip.vue  …
├── components/             # 领域组件（§3.2）
├── views/
│   ├── Home.vue  Runtime.vue  Build.vue  Image.vue
│   ├── Entity.vue  Lookup.vue  Findings.vue
│   └── data/               # 调测面，唯一允许 import element-plus 的目录
│       ├── DataShell.vue  TableBrowser.vue  SqlConsole.vue  SchemaView.vue
├── model/
│   ├── entities.js         # 显示清单（ux-design §11），新增域只改这里
│   ├── findings.js         # 质量条目
│   └── metadata.js         # PRAGMA 读取与缓存：列、类型、外键图
├── composables/
│   ├── useDatabase.js      # sql.js + IndexedDB 缓存
│   └── useQuery.js         # 查询 + 结果缓存
└── router.js
```

---

## 10. 质量门禁

| 门禁 | 工具 | 触发 |
| --- | --- | --- |
| 代码规范 | ESLint + `eslint-plugin-vue` | 提交前 |
| **样式规范** | stylelint + 自定义规则：`src/ui/` 与 `src/components/` 内**禁止字面量颜色/间距** | 提交前 |
| 包体预算 | 构建脚本断言：产品面 chunk 不含 `element-plus`；JS/CSS gzip 不超 §5 | 构建 |
| 可访问性 | axe-core（CI）+ 每阶段人工键盘走查 | 阶段验收 |
| 性能 | Lighthouse（perf / a11y ≥ 90） | 阶段验收 |
| 视觉回归 | Playwright 截图对比（Phase 4 后引入） | 可选 |

---

## 11. 工作量估算

| 阶段 | 内容 | 人日 |
| --- | --- | ---: |
| 0 | 设计系统 + 14 基元 + EP 隔离 + 门禁 | 4 |
| 1 | 运行视图 | 3 |
| 2 | 首页（概念图 SVG 占大头） | 3 |
| 3 | 反查条 | 1.5 |
| 4 | 档案页 + FK 自动关联 + ego 图 | 4 |
| 5 | 调测面收拢（复用已有） | 1.5 |
| 6 | 构建视图 | 2 |
| 7 | 镜像视图路径树 | 2.5 |
| 8 | 质量页 + 浅色主题 | 2 |
| | **合计** | **23.5** |

Phase 0+1+2 = 10 人日，是第一个可对外演示的节点。

---

## 12. 现有代码处置

| 资产 | 处置 |
| --- | --- |
| `vue` / `pinia` / `vue-router` / `sql.js` / `vite` | **保留** |
| `element-plus` + `@element-plus/icons-vue` | **保留但隔离**到 `src/views/data/`；从 `main.js` 移除全局引入 |
| `unplugin-auto-import` / `unplugin-vue-components` + EP resolver | **保留**，但 `Components` 的 `dirs` 限定在 `src/views/data/` |
| `views/*List.vue`（8 个）+ `TableView.vue` | **迁移**到 `src/views/data/`，路由改 `#/data/<table>` |
| `PropTable` / `RecordViewer` | **重写**为 `ui/DataGrid` 与 `ui/CodeBlock`（token 化） |
| `DetailSidebar` / `NavBar` / `BottomNav` | **替换**：v3.1 的导航只有四项 + 两个次级入口，侧边详情改为独立档案页路由 |
| `utils/columns.js` | **替换**为 `model/metadata.js`（改为 PRAGMA 动态读取，不再手写列定义） |
| `styles/main.css`（含 `--el-color-primary` 覆盖） | **拆分**：EP 主题覆盖移入调测面；产品面改用 `tokens.css` |
| `router.js` | **改写**为 ux-design §10 的路由表 |

---

## 13. 风险

| 风险 | 影响 | 应对 |
| --- | --- | --- |
| 自建 14 个基元质量不如成熟库 | 产品面观感不稳定 | Phase 0 先做 `#/dev/ui` 预览页集中评审；基元不过关不进 Phase 1 |
| 概念图（§3.2）做不好会很"PPT" | 首页是核心目的，做砸影响最大 | 先出静态 SVG 稿评审，确认后再接数据 |
| 8.9 MB db 在低配机上加载慢 | 首次体验差 | IndexedDB 缓存 + 首页不依赖 db + Skeleton 占位；必要时按需加载表 |
| 与并行进行的 v2 实施冲突 | 返工 | §1 的分界线即是合并方案：v2 产出整体转为调测面，不丢弃 |
| 产品面与调测面视觉割裂 | 观感不一致 | 刻意为之：调测面入口处加"调测视图"标识，让割裂成为**信号**而非缺陷 |

---

## 14. 实施记录（2026-10-19）

### 14.1 已完成

| 阶段 | 状态 | 产出 |
| --- | --- | --- |
| 0 设计系统 | ✅ | `styles/tokens.css`（全套 token）、`styles/element-theme.css`（EP→token 映射，`--el-*` 只出现在这一个文件）、`ui/Icon.vue`（内联 SVG，替换全部 emoji） |
| 1 运行视图 | ✅ | `model/runtime.js`、`RuntimeUnitCard`、`views/Runtime.vue`、`views/RuntimeUnit.vue` |
| 2 首页 | ✅ | `views/Home.vue`：概念模型图（连续主干 + 横刺）、三读法卡片、四张能力卡、扫描概要 |
| 3 反查 | ✅ | `model/lookup.js`、`views/Lookup.vue`，顶栏常驻 + ⌘K |
| 5 调测面 | ✅ | 8 个表格页迁到 `#/data/<table>`，带琥珀色「调测视图」横幅、compact 密度 |
| 6 构建视图 | ✅ | `views/Build.vue`：56 个子系统分面、按入度排序 |
| 7 镜像视图 | ✅ | `views/Image.vue` + `TreeNode.vue`：按文件数倒序、默认展开最大分区、每目录 100 条分批 |
| 4 实体档案页 | ✅ | `model/metadata.js`（PRAGMA 驱动）、`model/entities.js`（显示清单）、`views/Entity.vue`、`components/JsonValue.vue` |

| 8 质量页分派 + 浅色主题 | ✅ | `useTheme.js`、`tokens.css` 的 `html.light`；质量条目标注涉及的部件/仓 |

未做：质量页的跨扫描趋势位（库里只有一次扫描，没有可比对象）。

#### Phase 4 的关键点：关联区零代码

`views/Entity.vue` 的"关联"区**没有一行领域代码**，全部由 `PRAGMA foreign_key_list` 生成：
正向跟本表的外键走，反向扫描其它表指向本表的外键。`init` 部件的档案页因此自动长出
7 条关联（仓 / feature 26 / 对外接口 16 / 安装模块 77 / SA 2 / 服务 5 / syscap 4）。

`model/entities.js` 是唯一需要手写的部分，一个域约 8 行（图标、标题取法、所属视角）。
**没有条目的表也能打开**——用通用模板，标题取主键、关联靠外键，只是没有图标、不进视角。
`tools/smoke.mjs` 用 `#/e/syscaps/1`（无清单条目）与 `#/e/collector_runs/1`（无 id 列）守住这条。

三处呈现上的决定：
- **外键列不进属性表**。`repo_id 318` 对读者无意义，它已经在"关联"里以仓名呈现。
- **JSON 列不原样 dump**。`init` 的 features 有 26 项、deps 有 27 个部件，直接打印会吃掉整屏。
  改为 `JsonValue` 组件：字符串数组渲染成 chip + "还有 N 项"，对象逐键展开，其余折叠。
- **`deps.components` 渲染成可点链接**。名字就是部件名，查一次 id 映射即可——
  这是最便宜的依赖导航，不需要 ego 图就能一跳跳过去。

### 14.2 包体实测（§5 预算全部达标）

| | 改前 | 改后 | 预算 |
| --- | ---: | ---: | ---: |
| 首包 JS（gzip） | ~350 KB | **139 KB** | ≤ 180 ✅ |
| 首包 CSS（gzip） | 364 KB raw | **14.5 KB** | ≤ 40 ✅ |
| element-plus 独立 chunk | 920 KB | 消失 | — |

920 KB 不是 Element Plus 本身胖，是两处配置抵消了按需导入：
`manualChunks: { 'element-plus': ['element-plus'] }` 把整包钉成一个 chunk，
`import 'element-plus/dist/index.css'` 引了全量样式。两处都已移除。

### 14.3 性能实测（`npm run perf`）

```
✓ 首页 LCP（未加载 db）         372 ms  (预算 1000)
✓ #/runtime（含 8.9MB db）     676 ms  (预算 3000)  DOM 2232
✓ #/build （含 8.9MB db）      835 ms  (预算 3000)  DOM 4165
✓ #/image （含 8.9MB db）      609 ms  (预算 3000)  DOM  431
✓ 运行视图切换筛选                88 ms  (预算  100)
```

### 14.4 自验工具链

| 命令 | 作用 |
| --- | --- |
| `npm run shoot` | 9 个视图逐个截图到 `shots/`，同时抓控制台错误、横向溢出、空内容 |
| `npm run perf` | 核验 §5 性能预算 |
| `npm run smoke` | 15 条行为断言：运行视图计数、混装数、反查六级回退、调测横幅等 |
| `npm run a11y` | 文本对比度 AA（逐元素实算前景/背景比）、键盘焦点可见、360px 无横向溢出 |
| `npm run menu` | 下拉菜单可用性回归：鼠标真实移入不消失、点击外部与 Esc 关闭、菜单项可点达 |
| `npm run verify` | 以上各项一起跑 |

三者都依赖 `npm run dev` 在 5173 运行，并通过 `?db=knowledge.db` 自动加载数据库
（`useDatabase.loadDatabaseFromUrl`，既是验证入口也是分享用法）。

容器里要装 `fonts-noto-cjk`，否则截图里中文全是豆腐块，无法判断观感。

### 14.5 实施中改掉的设计决定

| 原计划 | 实际 | 原因 |
| --- | --- | --- |
| 自建 14 个基元 | **只自建 Icon + PathChip + 领域组件**，其余用 Element Plus | 用户同意用成熟库；EP 按需导入后体积可接受，省 4 人日 |
| Element Plus 仅限调测面 | **两面通用，但只经 token 主题化** | 同上。`--el-*` 变量集中在 `element-theme.css` 一处，视觉仍由我们控制 |
| 图标用 emoji | **全部换成内联 SVG** | emoji 跨平台渲染不一致，缺字体直接豆腐块——首批截图就暴露了 |
| 镜像树虚拟滚动 | **每目录分批 100 条 + "还有 N 个"** | `system/lib` 直接文件 1100+，分批比虚拟滚动简单，且"还有 N 个"本身是有用信息 |
| 反查"命中即停" | **全部列出，按证据强度分组** | `accessibility` 同时是服务名和部件名，只给一种会让人以为另一种不存在 |

### 14.6 修掉的缺陷

1. **`Image.vue` 用运行时模板**定义递归 TreeNode——Vite 默认 runtime-only 构建，浏览器里会直接挂。改为真正的 SFC。
2. **`watch(tree, …)` 写在 `const tree = computed(…)` 之前**，TDZ 报错。
3. **目录按字母序**导致 `chip_prod`（1 个文件）排在 `system`（5020）前面，首屏毫无信息。改为按文件数倒序 + 默认展开最大分区。
4. **`sas/hdis.process` 列已被 scanner 在 `8a8a0b2` 删除**，`runtime.js` / `lookup.js` 仍在 SELECT 它——旧库能跑、新库必崩。进程名改为统一由 `services` 承载（SA 宿主取 `services.name`，hdf 宿主取 cfg 的 `-n` 参数）。
5. **命令行缺空格**：`{{ exe }}<template v-for> {{ a }}</template>` 的前导空格被 Vue 模板编译吃掉，显示成 `sa_main/system/profile/x.json`。
6. **混装提示埋在 16 条 SA 之后**，要滚到底才看见这一屏的头条。挪到内容之前。

### 14.7 可访问性：自验工具抓出的真缺陷

`tools/a11y.mjs` 逐元素实算对比度，第一次跑就抓到两类问题：

**① `--text-secondary` 实测只有 4.18:1，token 注释里写的 4.6:1 是错的。**
首页 30 处、运行视图 808 处、构建视图 1410 处文本低于 AA。根因是整个灰阶偏暗，
且大量承载信息的文字用了 `--text-disabled`（#545d68，对卡片背景仅 1.91:1）。

修法不是把数值调亮了事，而是重新定义这一组 token 的职责，并把实测值写进注释：

| token | 值 | 最差表面对比度 | 职责 |
| --- | --- | ---: | --- |
| `--text-primary` | `#adbac7` | 5.47:1 | 正文 |
| `--text-secondary` | `#a0aab4` | 4.58:1 | 任何表面都可承载正文，含浮层 |
| `--text-tertiary` | `#96a0ab` | 4.80:1（raised） | 卡片/页面上的次要信息，**不用于浮层** |
| `--text-disabled` | `#768390` | 3.29:1 | **只做装饰与禁用态，不承载信息** |

同时发现 `--entity-repo`（#768390）被用来渲染概念图里的数字「525」——
实体强调色是按"图形 ≥3:1"选的，拿来写字就不够。改回正文色，并在该处写明原因。

**② 360 px 下顶栏横向溢出。** 顶栏在窄屏塞不下 4 个视角 + 反查 + 两个次级入口 + 库选择器。
改为换行布局：视角只留图标、反查独占第二行、420px 以下隐藏品牌名。

这两条都是设计文档里写了标准、但实现时没做到的——**没有自验工具就不会被发现**。

### 14.8 浅色主题：对 token 抽象的检验

加浅色主题**没有改动任何组件**——只在 `tokens.css` 增加一段 `html.light` 变量覆盖，
`element-theme.css` 的映射从 `html.dark` 扩成 `html.dark, html.light` 共用。
这正是 Phase 0 想验证的：如果当时有任何一处硬编码颜色，这一步就会暴露出来。

浅色配色同样由 `THEME=light npm run a11y` 实测把关（三个视图、4358 处取样全部 AA）：

| token | 暗色 | 浅色 | 浅色最差对比度 |
| --- | --- | --- | ---: |
| text-primary | `#adbac7` | `#1f2328` | 13.93 |
| text-secondary | `#a0aab4` | `#4a535d` | 6.90 |
| text-tertiary | `#96a0ab` | `#59636e` | 5.39 |
| entity-component | `#4ea8ff` | `#0757ba` | 6.01 |
| severity-error | `#f47067` | `#b42318` | 5.80 |

两处必须随主题翻转的量：`--text-inverse`（严重度徽标在暗色是深底浅字、浅色是深底白字）
与阴影透明度（浅底上用暗色主题的阴影会显脏）。

### 14.9 同一个错误犯了两次

`<script setup>` 里 `watch(..., { immediate: true })` 的回调**在模块求值期间同步执行**，
若引用了写在它下面的 `ref`/函数，就是 TDZ 报错，整页白屏。
第一次出现在 `Image.vue`（`watch(tree)` 早于 `const tree`），第二次出现在 `Findings.vue`
（`owners` 早于 `const owners = ref()`）。

两次都是 `npm run shoot` 的控制台错误抓到的——`npm run build` 不会报，因为语法完全合法。
**约定：`<script setup>` 里所有 `watch(..., {immediate:true})` 一律放在文件末尾，
所有 ref/computed/函数声明在前。**

### 14.10 下拉菜单"鼠标一移过去就消失"

用户报的缺陷：顶栏的库选择下拉，鼠标往下一移菜单就没了，根本点不到。

根因有两层：

1. **几何**：菜单定位在 `top: calc(100% + 4px)`，那 4 px 视觉间隙落在 `.aux-menu`
   容器盒子**之外**（菜单是绝对定位，不撑开容器）。指针从按钮往下移，一进间隙
   就离开了容器，`@mouseleave` 触发。
2. **交互模型**：这两个菜单是**点击**打开的，却用 `mouseleave` 关——两种模型混用。
   调测菜单因为额外挂了 `@mouseenter="debugOpen = true"` 会被重新打开，侥幸没暴露；
   库菜单没有，所以每次都中招。

修法是把交互模型摆正：**点击打开 → 点击外部 / Esc 关闭**，删掉全部 hover 逻辑；
顺手把 4 px 间隙改成 `margin-top` 并用一条透明 `::after` 桥接，防止将来再有人按 hover 思路改。

回归测试 `tools/menu.mjs` 用 `page.mouse.move` 分 8 步真实移动指针穿过那条间隙，
而不是直接 `click()`——后者会瞬移到目标，永远复现不了这个 bug。
把修复撤回验证过：旧代码下该测试 2 项失败（其中一项是点击穿透到背后的卡片、
跳去了 `/runtime/128`，正是"点了个寂寞"的症状），修复后全绿。

### 14.11 导航与上下文保持

用户反馈"页面之间跳转后容易丢失当前路径信息"。分析与选型见
`docs/navigation-options.md`，URL 契约见 `docs/url-spec.md` v2.0，这里只记要点。

问题不是一个而是三个：**状态**（筛选/展开/滚动，存在组件 `ref` 里，卸载即蒸发）、
**来路**（无面包屑，`#/e/install_targets/4210` 本身不含上下文）、
**位置感**（`RuntimeUnit` 的"← 运行视图"用 `router.push`，是往历史里再压一格）。
实测代价：运行视图筛到 28 张卡 → 进详情 → 后退 → 回到 164 张。

做法：

- **URL 即状态**。`useQueryState` 把 query 参数当 ref 用。纪律是
  **写状态 `replace`、跳转 `push`**——这一条决定后退键是否正确，不是风格问题。
- **叶子浮抽屉，枢纽换整页**，由外键**入边数**判定，不写死表名。
  按行数 62% 的行是叶子，产品面最高频的两个点击都落在叶子上。
- **结构面包屑**沿归属外键向上推导，深链接直开也成立。

顺手删掉 v2 遗留的 `DetailSidebar.vue` / `PropTable.vue` / `RecordViewer.vue`
（Pinia 驱动、硬编码字段清单、模板里每渲染一次查一次库），`Entity.vue` 从 271 行
缩成 38 行的外壳，内容本体 `EntityDossier.vue` 由整页与抽屉共用。

两条值得记住的教训：

1. **`onBeforeUnmount` 里读 `route.fullPath` 读到的是新路由。** 滚动位置因此
   被写进下一个页面的键，Build 与 Entity 互相覆盖。正确时机是
   `watch(() => route.fullPath)`——pre-flush，元素还在、键还对。
2. **测试自己会制造假象。** `locator.click()` 为点到元素会把列表自动滚回顶部，
   "点第一张卡片"等于自己清零滚动位置，于是测出一个不存在的 bug；
   `.file` 还会命中顶栏那个隐藏的"打开本地 .db"label。
   先确认失败是真的，再动手修——这次差点修了个没坏的东西。

回归 `tools/nav.mjs` 33 条，已并入 `npm run verify`（现七项）。

### 14.12 质量页：抽屉版式 + 问题码的人话解释

两处改动，都来自用户反馈："上面点击、下面显示难以使用"，以及"每个问题加上友好的解释"。

**版式**：详情从列表下方搬进侧边抽屉。上列表下详情的版式，点到第三条就得把前两条
的位置重新找一遍；抽屉让列表保持原位、当前条高亮。外壳抽成
`components/SideDrawer.vue`，与镜像/构建视图的叶子抽屉共用——
`DetailDrawer.vue` 也改为基于它，少了一份重复的抽屉 CSS。

**解释**：`src/model/issues.js`，15 个码逐条对着采集器源码写（不是对着码名猜），
每条三段：这是什么 / 为什么要管 / 怎么处理。其中"为什么要管"必须写明
**扫描以谁为准**——`MODULE_COMPONENT_CONFLICT` 以 GN label 为准、
`SUBSYSTEM_DIFFERS` 以构建索引为准，不说清楚的话使用者无从判断该不该管。
末尾一层按词尾的兜底（`*_UNMATCHED`、`*_AMBIGUOUS`、`*_DIFFERS` 等 12 类），
新采集器带来的新码不会变成空白，只是解释更泛并明确标注"按码名归类给出"。

顺带补了两个实际的缺口：

- 实例列表原先 `SELECT` 了 `details` 却从不渲染。`unresolved=nfc`、
  `bundle=musl part_name=build_framework` 这些才是动手的依据，现在摊成 k=v 小块。
- "涉及哪些部件"原先在模板里按行查，渲染一次十几条 `DISTINCT` 查询；
  改成进页面时一次分组查完。

`tools/a11y.mjs` 又抓到一个真缺陷：选中行的底色是 `--surface-overlay`，
而行内的问题码与采集器名用了 `--text-tertiary` —— 浮层上只有 4.07:1。
`tokens.css` 里本就注明"浮层上改用 secondary"，按既有规则改掉。
**行内文字一律 secondary 起步**，因为任何行都可能进入 hover/选中态。

nav.mjs 增加 9 条质量页断言（人话标题、走抽屉不是下方展开、列表不被顶走、
当前条高亮、实例带 details、chip 收口、Esc 可关），现共 33 条。

### 14.13 运行视图改表格

卡片换成 el-table：19 列、任意列排序、筛选、搜索、列显隐、行展开下钻、
导出 CSV/JSON，状态全部进 URL。评估与实测见 `docs/runtime-table-assessment.md`。

三件值得记住的：

**1. 三态不能当二态。** `sandbox` 有 35 行是 `0`、129 行是 `null`——
显式关闭和没声明是两个事实，一律渲染成空白就把信息抹了。排序上"未声明"必须
**恒定排末尾、升降序都一样**，否则降序时先看到的是一百多行空白。
这条不能交给 el-table 的 `sort-method`：它对降序会把比较结果整个取反。
所以列用 `sortable="custom"`，排序自己做——顺带保证导出内容与屏幕一致。

**2. 字段解释要分清两类陈述。** `model/fields.js` 每列写"含义"（init 通用约定）
与"在 oskm 里怎么来的"（扫描器做了什么），分开标注，不把推断当规范。
第三段"本次扫描的分布"**实时算**——写死的数字会随产品变化而说谎，
这个项目已经为此改过两次文档。

**3. el-table 的代价要如实记账。** 筛选切换从 65 ms 涨到 ~420 ms。
逐项 A/B 证明优化不了：把整个单元格模板塌成一个纯插值仍要 420 ms，
开销在 el-table 自身的每行机制里。`tools/perf.mjs` 的预算从 100 ms 调到 600 ms，
但在代码注释里写明这是**取舍而非迁就**，列出了唯二的真解法（虚拟滚动 / 分页）
及它们各要砍掉什么功能。降低自己定的质量线必须留下理由。

另外，我的第一版三态排序测试是**假阳性**——用「沙箱」测，它的有值行全是 `0`，
升降序看起来一模一样。换成有两种取值的「按需启动」才真的验到方向。
先确认失败是真的，也要先确认通过是真的。

`tools/table.mjs` 24 条，并入 `npm run verify`（现八项）。

### 14.14 二级菜单与六个列表视图

一级三组（运行时进程 / 部件信息 / 系统文件）+ 常驻子导航条，七个二级视图。
方案与实测见 `docs/nav-two-level-proposal.md`。

**二级不用下拉，用常驻子导航条。** 子项常驻可见（不点开就知道同组有什么、各多少条），
点一级直达该组第一个子项（一次点击不是两次），两层同时高亮。下拉菜单的指针进出
是 §14.10 刚修过 bug 的那类交互，加三个下拉就是三份同样的风险面。

**抽 `EntityTable.vue`。** 六个视图要表格，照抄六遍是两千行重复、改一个 bug 改六处。
视图只管取数与分面筛选，表格管搜索/排序/分页/列显隐/导出/ⓘ表头/三态渲染/超量内容。
`Runtime.vue` 因此从 382 行缩到 113 行，新视图各 48–98 行。
回归也跟着收敛：一组断言覆盖六个视图。

**分页把 el-table 的规模问题解决了。** 安装目标 5804 行一次铺完要 33 秒（实测），
分页后 2.5 秒。关键是分的只有渲染——排序、搜索、导出都在全量上做，
所以导出按钮上的数字永远是整个筛选结果而不是当前页。
§14.13 为 el-table 放宽到 600 ms 的筛选预算，这一轮收回到 400 ms。

四个值得记住的：

1. **差点覆盖掉调测面的视图。** `views/RepoList.vue` 已经存在（`/data/repos` 的壳子），
   同名新建直接盖掉。产品面列表统一挪到 `views/list/`，与调测面彻底分开。
   新建文件前先看目录。
2. **不要跟第三方 CSS 比选择器优先级。** 分页器当前页码 2.51:1，我加了同优先级的
   覆盖规则没生效——按需导入的组件 CSS 总是后加载。改写它读的那个 CSS 变量
   （`--el-color-white` → 我们的 `--text-inverse`）才是对的做法。
3. **至少要有两列默认可见且用 `min`。** 一列都没有则右边留一条空白，
   只有一列则它把剩余宽度全吃掉。
4. **换了布局就要重新确认滚动记忆挂在哪。** 列表的滚动容器从视图自己的
   `overflow:auto` 变成了 el-table 内部的 `.el-scrollbar__wrap`。

`tools/table.mjs` 扩到 41 条，`tools/nav.mjs` 扩到 42 条（含两级菜单与旧址重定向）。

### 14.15 详情统一走抽屉，label 带源码链接

四件事：列表取消行展开、详情统一抽屉、抽屉点外部自动关闭、GN label 旁给出源码地址。
第四项的评估见 `docs/detail-surface-assessment.md`。

**取消按叶子/枢纽分流。** §14.11 建立的那条规则（外键入边数 ≥1 走整页）本轮取消了。
不是因为抽屉放不下，而是分流的代价被低估：同一个列表里点不同的列会得到不同形态，
"什么时候浮、什么时候跳"变成要背的东西；而换页丢掉筛选/排序/页码/滚动位置的代价，
对枢纽和叶子**是一样的**。`openEntity` 现在一律抽屉，`isLeaf` 删掉。
`/e/<table>/<id>` 降级为深链接落地页与「在新页面打开」的去处。

**一行里不该有两种点击行为。** 主列原先链到整页、整行又开抽屉，于是点名字会发出
两次 `push`，后者覆盖前者——`tools/nav.mjs` 抓到的。处理：主列去掉自带链接
（整行点击就是看详情），单元格内的跨实体链接加 `.stop`。

**label → BUILD.gn。** 按最长路径前缀把 label 目录匹配到 `repos.path`，
实测 5395/5395 全部命中；用 `head_commit` 而非 `revision`（后者是 master，会漂移）。
两条边界写进了 `title`：目标可能定义在 `.gni` 里、URL 形态是按惯例拼的。
各托管站的拼法集中在 `model/gitlink.js` 一张表里。

三个踩到的：

1. **「在新页面打开」不能同时调 `close()`。** 两个导航互相抢，实测 `close` 的
   `replace` 会把跳转吃掉。跳到新路径时 `detail` 自然就没了，本来就不用关。
2. **测试方法自己破坏了被测对象。** 我用 `location.hash = …` 制造导航来测"真返回"，
   但那是浏览器行为、不经 vue-router，`history.state.back` 是空的，
   于是 `goBackTo` 判定"没有来路"而改走 push——测出来的失败是我造的。
   只能用界面上真实存在的入口。
3. **批量改路由时 `go('/build')` 这种不带 `#` 的写法会漏网**，而且因为有重定向
   所以不报错、只是测到了别的东西。连踩两次。

`tools/table.mjs` 扩到 50 条，`tools/nav.mjs` 46 条。

### 14.16 抽屉详情重排

反馈是"展示效果较差"。实际毛病有六处，逐条对着改：

| 毛病 | 处理 |
| --- | --- |
| 属性区单列堆叠，5 个字段吃掉 220px | 两列表格 `FieldTable.vue`，同样内容占不到一半高度 |
| 字段名退回 `dest_index` 这种原始列名 | 复用 `model/columns/*.js` 的人话目录，带 ⓘ 说明 |
| 未声明的字段被过滤掉 | 改为可展开查看——"没声明"本身是事实，滤掉等于让人以为字段不存在 |
| `record` 里 21 个未成列的字段从不露面 | 新增"其它声明"区，同样表格化 |
| 三镜头常常整块是 `—` | 空镜头不渲染，全空则整块不出现 |
| 不能折叠 | 四个区块都可折叠，状态按**区块名**记在 localStorage |

折叠状态按区块名记而不是按实体记：换一个实体不该让人重新展开一遍。
存 localStorage 不进 URL，因为这是浏览偏好、属于人不属于页面（`url-spec` §5）。

`services/51` 的抽屉从"5 个字段 + 一坨 JSON"变成：10 个属性（人话名 + ⓘ）、
9 个此前完全看不到的原始声明（`caps` / `permission` 102 项 / `critical` /
`jobs` / `writepid` …）、18 条关联、可折叠的 record 原文。

**`tools/a11y.mjs` 第三次抓到同类缺陷**：选中行底色是 `--surface-overlay`，
而行里的链接是 `--entity-component`——在 overlay 上只有 4.31:1。
顺着查发现 `--el-fill-color-light` 也映射到 overlay，于是**悬停任何一行**都会掉下去。
两处都压回 `--surface-raised`（5.08:1），并把规则钉进 `tokens.css`：

> 浮层底色 `--surface-overlay` 上不要放 `--entity-component` 文本（4.31）
> 也不要放 `--text-tertiary`（4.07）——浮层上一律用 secondary 起步。

两条都是工具抓出来的，不是推演的。这类"某个颜色在某个底上不够"的问题，
凭眼睛看永远看不出来。

`tools/table.mjs` 扩到 58 条。

### 14.17 首页改为三段式导航图

方案与实测见 `docs/home-options.md`。核心是一个观察：
**顶栏的三个一级分组恰好是概念链的三段**（源码 → 镜像 → 运行）。
不是巧合——目录结构本来就按这条链分的。

所以概念模型图和导航合成了一张：每个方块就是一个二级视图的入口，
方块上的数字就是该视图的行数。这同时解掉两件事：

- **词汇只剩一套**。原先首页讲"构建/镜像/运行三种读法"，顶栏讲
  "运行时进程/部件信息/系统文件"，新人在首页学会的三个词在顶栏一个都找不到。
- **入口不会再和视图对不上**。实测原先 7 个节点有 **5 个落错地方**
  （点"仓 525"进部件列表、点"SA 165"进服务列表），是上一轮新增四个视图时
  漏改的——因为首页入口和实际视图是两套各自维护的东西。

顺带删掉重复的"三种读法"与"你可以用它做什么"两块：它们和概念模型说的是同一件事。
首页内容高度从 **1316px 降到 848px**，整个装进一屏。

另外两件：

- **扫描可信度提到首屏**。本次 6 个采集器有 3 个 degraded、13 条扫描层问题。
  我们自己在 `issues.js` 里写了"先解决扫描层问题再信其余数字"，
  那它就该出现在数字旁边，而不是数字下面滚两屏的地方。
- **反查输入框在首页有实体位置**。它是测试集成人员的主入口，
  原先只在首屏外的卡片里提了一句。

回归加了一条关键断言：**首页每个方块的落点必须等于它标注的视图**。
这次的 5 个错链接，有这条就不会发生。另外守住首屏高度 ≤ 视口 × 1.2。

`a11y.mjs` 又抓到一个：新加的"反查"按钮禁用态是 `--text-secondary` 落在
`--border-default` 上，3.69:1。WCAG 豁免禁用控件，但看不清的按钮依然是看不清，
换到 overlay 底上（4.58）。

`tools/nav.mjs` 扩到 51 条。

### 14.18 超量内容把链接吃掉了；整页档案不再掐宽度

**一个真 bug。** 安装目标列表里大量"安装模块"格子点不开，例如
`//vendor/hihope/rk3568/preinstall-config:install_list_permissions_config`。

查下来不是数据问题——这个 label 有 `module_id`、也能匹配到仓。
是 `EntityTable` 的单元格渲染把「超量内容」写成了**第一个分支**：

```
v-if="isLong(row, c)"      ← 超过 full 阈值就整格换成"查看全文"按钮
v-else-if="c.type==='label'"  ← 永远到不了这里
```

`targets.js` 给 label 的阈值是 64 字符，而**66% 的 label（3654/5501）超过 64**——
于是三分之二的格子连同链接和去源码的 ↗ 一起被吃掉。

改法：⤢ 改为**追加在内容后面**，不再替换内容。回归断言写成"有 ⤢ 的格子
同时要有链接和 ↗"，而不是按比例——首页按 dest 升序排的是 ramdisk 那批、
label 普遍较短，按 66% 去断言会假阳性。

**整页档案去掉 940px 封顶。** 实测 1760px 视口下整页只用了 940px，浪费 47%。
抽屉与整页服务的动作本就不同（扫一眼就走 / 读完对照复制），
不该共用一套纵向单栏——那等于让整页迁就抽屉。

整页改为「头部通栏 + 属性/其它声明在左、关联在右」两栏，`min-width: 1180px`
才分栏，窄了自动回单栏；抽屉不受影响。用 `grid-template-areas` 而不是两个
div：区块缺席不留空洞，也不必为整页另写一套模板——另写必然两边长歪。

部件详情页的三项专项优化（属性按列目录分组、反向关联默认展开前几条、
"自己就是该域主角"时不显示对应镜头）写在 `docs/dossier-layout.md` §5，待决策。
三项都是通用改进，不是部件专属补丁——给单个实体写专门模板会开坏头。

`tools/table.mjs` 扩到 64 条。

### 14.19 部件档案三项优化

`docs/dossier-layout.md` §5 的三项全部实施，其中一项换了更简单的实现。

**属性按列目录分组。** 部件档案的属性区从平铺变成 身份 / 依赖 / 产出 三段。
顺带查出一个错配：列目录里的 `features`/`syscaps` 描述的是"关联行的计数"
（列表视图那一列），而库里的同名列装的是 bundle.json 的原始 JSON 数组——
名字撞了、含义不是一回事。给这三个原始列单独写条目，并把查找顺序改成
**本表的 EXTRA 优先于列目录**。

**反向关联默认露出条目**（抽屉 3 条、整页 6 条），超出给"还有 N 条"。
"这个部件产出了什么"正是打开部件档案的首要问题，折起来再要求点开没道理。

**三镜头的判据比原设想简单。** 原方案要给每个实体登记"主域"；实现时发现
只需看**镜头有没有指向别的实体**：部件那三行全是反向关联的计数、没有跳转目标，
全隐藏；SA 那三行分别指向部件、安装模块、宿主进程，全保留。一行
`l.to || l.unit` 就够。三镜头的定位也因此更清楚——它回答"这个实体在另外两个域里
对应的是谁"，纯计数交给关联区。

两条回归写死了旧行为，跟着改：`smoke.mjs` 的「部件档案有三镜头」断言的正是本轮
刻意去掉的东西（改为断言分组，另加一条"SA 仍保留三镜头"守住边界）；
`table.mjs` 的「属性是两列表格」取第一行，而第一行现在是分组表头。

我自己写测试时又踩一次同类错误：用 `/^syscap/` 判断"裸列名"，结果"syscap 声明"
也被命中，造成假失败。要匹配裸名就得精确比对，不能用前缀。
