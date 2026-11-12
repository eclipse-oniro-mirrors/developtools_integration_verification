# 跨采集器关联：features→gn_args、innerapis→install_modules

日期：2026-10-20
状态：**可选方案**，未改代码。

针对：为 components 的 `features` 关联 gn_args 的特性开关、为 `innerapis` 关联
install_modules。时序上 components 先跑，关联对象却是后跑的采集器。

全部结论基于对 rk3568 的实测与现有框架代码，测量方法见 §7。

---

## 1. 问题就是一个环

现有依赖图（`DEPENDS_ON` + `resolve_order()` 拓扑排序）：

```
repos → components ─┬→ args            (DEPENDS_ON components)
                    └→ install_modules (DEPENDS_ON components)
                           └→ elf_modules / hdi / sas
```

两个需求都要让 **components 指向它自己的下游**：

| 需求 | 需要的方向 | 后果 |
| --- | --- | --- |
| `features.gn_arg_id` | components → args | `args` 已依赖 components → **环** |
| `innerapis.install_module_id` | components → install_modules | 同上 → **环** |

`resolve_order()` 会直接抛 `DEPENDENCY_CYCLE`。所以不能靠加 `DEPENDS_ON` 解决。

### 1.1 现有的三个机制，哪个管用

| 机制 | 作用 | 能不能用在这 |
| --- | --- | --- |
| `DEPENDS_ON` + 拓扑序 | 决定执行顺序 | **不能**，成环 |
| `ctx.upstream.rows(table)` | 下游从库里读上游结果 | 能，但只能下游读上游 |
| `resolve_rows(table, rows, keys)` | 插库前最后改写一次行 | **不能**，`keys` 只含**本采集器**已插入的表 |

还有一条现成的惯例，比机制更重要：**外键一律长在下游表上，由下游采集器填**。
`install_modules.component_id`、`hdis.component_id`、`sas.install_module_id`、
`gn_args.component_id` 全是这个模式——没有一处是上游回头去填自己的列。

---

## 2. 关联本身可行吗：先量

### 2.1 features → gn_args：98%

| | |
| --- | ---: |
| `features` 行数 | 1351 |
| `gn args --list --short` 输出的开关 | 2990 |
| 按名字命中 gn args | **1316** |
| 再用 `features.json` 兜底后 | **1320（98%）** |
| 两边都查不到 | 31 |

查不到的 31 个里有明显的声明错误，例如
`build_framework_feature_verify = ture`——**把值和拼写错误一起写进了 feature 名**。
这类应当报出来而不是静默丢掉。

基数：1351 行对应 1351 个不同名字，**没有同名跨部件声明**，所以
`features` 行 → gn_arg 是干净的 **N:1**（这里 N=1）。

> 注：上面的 1316 当初是直接跑 `gn args --list --short` 量出来的，因为 `args`
> 采集器在本机恒出 0 条（`GN_ARGS_PARSE_FAILED`）。该 bug 已修——`gn` 必须在源码根下
> 运行，采集器没有设 `cwd`——现在采集器自己跑出 2,952 条，实测关联 **1316/1351**，
> 与手工测量一致。

### 2.2 innerapis → install_modules：73%

按 GN 目标名（label 冒号后那段）匹配：

| | |
| --- | ---: |
| `innerapis` 行数 | 1743 |
| 命中 1 个安装模块 | **1258** |
| 命中 2 个（有歧义） | **6** |
| 一个都没命中 | 479（27%） |
| 命中且模块归属部件与 innerapi 一致 | 1261 / 1264 |

**479 没命中是正常的**——innerapi 是"给别的部件用的接口"，不一定产出安装产物
（静态库、header-only、仅参与编译的目标都不会装进镜像）。这不是缺陷，
但值得作为 advisory 记一笔，便于看"哪些对外接口其实没进镜像"。

反向基数**不是 1:1**：1221 个模块对应 1 个 innerapi，但 **19 个模块对应 2–5 个**。
所以外键只能长在 innerapi 一侧（N:1），不能反过来。

---

## 3. 五个方案

### 甲：下游回填上游的列（UPDATE）

`args` 跑完后 `UPDATE features SET gn_arg_id = ...`。

- **优点**：外键长在语义上该在的位置（`features.gn_arg_id`），查询最直观
- **缺点**：
  - 破坏"每个采集器只写自己的表"——这是本项目目前唯一清晰的所有权规则
  - 框架只有 `emit → insert` 一条通路，要新开 UPDATE 口子
  - 重扫、部分选择采集器（`--only`）时，列是填了还是没填，取决于跑没跑 args，
    同一张表的同一列出现两种可信度
- **定位**：语义最顺，架构代价最大

### 乙：关联表，归下游采集器所有

```
feature_switches(feature_id, gn_arg_id, …)        由 args 产出
innerapi_modules(innerapi_id, install_module_id)  由 install_modules 产出
```

- **优点**：
  - **零框架改动、零环**——两个下游本来就依赖 components，读得到它的子表
  - 天然容得下歧义（6 个 innerapi 命中 2 个模块，可以两条都留，附证据强度）
  - **viewer 零改动**：关联区由 PRAGMA 外键图自动生成，新表自动出现在档案页
  - `--only args` 时关联表为空，语义清楚——没跑就是没有，不会出现"列填了一半"
- **缺点**：多一张表、查询多一次 join
- **定位**：改动最小、与现有架构最贴合

### 丙：外键反过来长在下游表上

`gn_args.feature_id`、`install_modules.innerapi_id`。

- **优点**：零改动，连表都不用加
- **缺点**：**基数不对**。19 个安装模块对应 2–5 个 innerapi，一个
  `install_modules.innerapi_id` 装不下；硬填只能丢掉其余的。
  `gn_args.feature_id` 这一半倒是成立（N:1），但两个需求用两套形状更难解释
- **定位**：对 features 勉强可行，对 innerapis **不成立**，不建议

### 丁：新增一个"关联采集器"

`component_links`，`DEPENDS_ON = ('components', 'args', 'install_modules')`，
产出上面两张关联表。

- 与乙的差别只在**归属**：关联表归一个专门的采集器，而不是挂在 args / install_modules 名下
- **优点**：
  - 两种关联的匹配规则、歧义处理、advisory 问题码集中在一处
  - `args` 与 `install_modules` 不必关心 components 的子表
  - 将来再加"innerapi → elf_module"之类的关联，有现成的落脚点
- **缺点**：多一个采集器；`--only` 的组合多一种
- **依赖无环**：args 与 install_modules 都已依赖 components，再加一个依赖它们三个的，拓扑成立

### 戊：给框架加一个 link 阶段

所有采集器跑完后，统一调用各自的 `link(ctx)` 做回填。

- **优点**：最通用，以后任何跨采集器关联都有地方放
- **缺点**：动框架核心，要重新定义 link 阶段能写什么表、失败算谁的、
  `degraded` 怎么往上传、`collector_runs` 怎么记。为两个关联引入一个新生命周期阶段，
  代价与收益不成比例
- **定位**：**现在不做**。等到跨采集器关联超过三四处、乙/丁开始显得零碎时再考虑

---

## 4. 推荐：丁（退而求其次是乙）

理由是三条，按重要性排：

1. **零框架改动，零环**。甲要开 UPDATE 口子、戊要加生命周期阶段，
   两者都在为两个关联改动所有采集器共用的地基。
2. **viewer 自动受益**。关联区、面包屑、实体档案全部由 PRAGMA 外键图驱动，
   新表加进去就自动显示，不用动前端一行。这是现有架构给的红利，用它。
3. **歧义有地方放**。6 个 innerapi 命中 2 个模块、479 个一个都不命中——
   关联表可以为前者存两行并标注证据强度，为后者什么都不存并记一条 advisory。
   单列外键这两种情况都只能"丢掉或瞎猜"。

选丁而非乙，是因为两种关联本质是同一件事——**把 components 的子表拿去和后跑的事实对齐**——
放在一处，匹配规则与问题码不会在两个采集器里各写一遍。

### 4.1 建议的表形状

```python
FEATURE_SWITCHES = Table('feature_switches', columns=(
    Column('feature_id', 'INTEGER', nullable=False, references='features(id)'),
    Column('gn_arg_id', 'INTEGER', references='gn_args(id)'),
    # 开关值的来源：'gn' | 'features_json'。两者都没有则不建行，记 advisory
    Column('source', nullable=False),
))

INNERAPI_MODULES = Table('innerapi_modules', columns=(
    Column('innerapi_id', 'INTEGER', nullable=False, references='innerapis(id)'),
    Column('install_module_id', 'INTEGER', nullable=False, references='install_modules(id)'),
    # 'target_name' 按 GN 目标名匹配；将来若加路径匹配就多一个取值
    Column('evidence', nullable=False),
    # 模块的归属部件与 innerapi 的部件是否一致（实测 1261/1264 一致）
    Column('same_component', 'INTEGER', nullable=False, default='0'),
))
```

`source` / `evidence` 不是装饰：没有它们，使用者分不清"这条关联是名字对上了"
还是"兜底猜的"。本项目已经为此吃过亏（归属判定一律要说明"以谁为准"）。

### 4.2 建议的问题码

| 码 | 条件 | rk3568 预计 |
| --- | --- | ---: |
| `FEATURE_SWITCH_UNRESOLVED` | feature 名在 gn args 与 features.json 里都查不到 | 31 |
| `INNERAPI_MODULE_AMBIGUOUS` | 一个 innerapi 命中多个安装模块 | 6 |
| `INNERAPI_NOT_INSTALLED` | innerapi 没有对应的安装模块 | 479 |

三条都是 `advisory=True`：输入都读得好好的，是产品声明之间对不齐。

`INNERAPI_NOT_INSTALLED` 有 479 条，量不小。**建议先做成 info 级**，
否则质量页会被它淹没——它多数时候是正常现象（静态库、header-only）。
如果确认噪声太大，就只留统计不逐条记。

### 4.3 分期

| 步 | 内容 | 前置 |
| --- | --- | --- |
| 一 | `component_links` 采集器 + `innerapi_modules` 表 | 无，现在就能做 |
| 二 | `feature_switches` 表 | `args` 采集器能出数（已满足，2,952 条） |

两步可以分开验收。

---

## 5. 一个需要你定的口径

`features` 表现在存的是**部件声明了哪些 feature 名**。关联 gn_args 之后，
"这个 feature 在本产品的实际取值"就有了。问题是**取值放哪**：

- **甲**：`feature_switches.gn_arg_id` 指过去，值从 `gn_args.current_value` 读
  （不复制，单一事实来源，但每次查询都要 join）
- **乙**：在 `feature_switches` 上再冗余一列 `value`
  （查询省一次 join，但同一个值存了两份，与本项目刚清理掉的
  `components.features` 三份拷贝是同一类问题）

**建议甲**。理由就是刚清掉的那条：同一事实不留第二份拷贝。

---

## 6. 不建议的做法

- **把关联算在 viewer 里**。前端 join 一次要 1743 次查询，而且扫描器的
  "事实库"定位要求关联是**扫描时确定的事实**，不是展示时的推测。
- **给 components 加 `DEPENDS_ON ('args','install_modules')`**。直接抛
  `DEPENDENCY_CYCLE`，框架已经挡住了。
- **让 components 自己去读 gn / SMI**。那等于把 args 与 install_modules
  的解析逻辑复制一份，两处会各自漂移——`install_modules` 当初就是为了
  消灭这类重复才建的。

---

## 7. 测量方法

- **依赖图**：读各 `collector.py` 的 `DEPENDS_ON`，与 `resolve_order()` 的实现对照
- **features → gn_args**：`prebuilts/build-tools/linux-x86/bin/gn args out/rk3568
  --list --short`（3453 行，2990 个开关），与 `features` 表的 1351 个值求交集；
  再用 `out/preloader/rk3568/features.json` 的 101 项兜底
- **innerapis → install_modules**：取 `innerapis.name` 与 `install_modules.label`
  冒号后的目标名比对，统计双向基数
- **所有权规则**：`grep` 各采集器的 `TABLES` 与 `emit()` 目标表，确认无交叉写入
