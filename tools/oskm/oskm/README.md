# oskm —— 采集流水线

扫描 OpenHarmony 源码树与构建产物，把事实写进单个 SQLite 库。
**12 个采集器**由注册表自动发现，按声明的依赖拓扑排序执行，每个只跑一次；
依赖经数据库传递，不嵌套扫描。

```
repos → arkts → components → args → install_modules → component_links
      → services → hdi → sas → elf_modules → arkts_links → ndk_headers
```

| 看什么 | 去哪 |
|---|---|
| 框架怎么工作 | [SQLite 注册表架构](../docs/architecture/sqlite-registry-architecture.md) |
| 新增一个领域 | [新增 collector 指南](../docs/architecture/adding-a-collector.md) |
| 取数共性 | [ElementCollector 抽象](../docs/architecture/element-collector-abstraction.md) |
| 跨域关系 | [统一模型](../docs/architecture/unified-model.md) · [跨采集器关联](../docs/architecture/cross-collector-links.md) |
| 某个采集器的细节 | `collectors/<域>/` 下的 `README.md` / `design.md` / `validation.md` |
| 表结构 | [`../oskm_schema/`](../oskm_schema/README.md)——**不在本目录** |

## 命令行

采集侧入口是 **`python3 -m oskm.cli`**（子命令 `scan` / `list` / `scans` / `drop`）。
子命令和 `--only` / `--without` 的可选值由注册表生成——新增一个采集器包即自动出现，
不需要改 CLI。

> **查询侧是另一个入口，两者没有共同命令。** 查询走独立产物 `oskm-cli`
> （`cli/dist/oskm-cli-<版本>.pyz`，或 skill 的 `bootstrap.py`）。
> 2026-11-12 之前有个 `packages/oskm/oskm.py` 在外面按子命令名分派两边，
> 已删除：它必须手抄一份查询侧子命令清单，漂了会把命令送去扫描侧，报出
> `invalid choice: '<你的 --db 路径>'` 这种方向完全错的错误。
> 见 [../docs/architecture/cli-skill-split.md](../docs/architecture/cli-skill-split.md)。

在 OpenHarmony 工程根扫描时，`packages/oskm` 不在 `sys.path` 上，所以要么
`cd` 过去，要么定义一个壳函数（下文示例用后者）：

```bash
cd <OpenHarmony 工程根>
PKG=KnowledgeBase/packages/oskm
oskm() { PYTHONPATH="$PKG" python3 -m oskm.cli "$@"; }
```

### 查看已注册的采集器与执行顺序

```bash
oskm list          # 等价于 PYTHONPATH="$PKG" python3 -m oskm.cli list
```

输出每个采集器的描述、`depends_on`、schema 版本，以及拓扑执行顺序 `repos → arkts → components → args → install_modules → component_links → services → hdi → sas → elf_modules → arkts_links → ndk_headers`。

### 扫描

```bash
# 一层布局，默认 arm64：扫描全部采集器，写入 SQLite
oskm scan --workspace-root "$PWD" --product wukong100 \
  --db KnowledgeBase/artifacts/wukong100/knowledge.db

# 显式指定非默认架构（写入 scans.cpu_arch，影响 system/lib 还是 system/lib64）
oskm scan --workspace-root "$PWD" --product <arm32 板型> \
  --cpu-arch arm --db KnowledgeBase/artifacts/<board>/knowledge.db

# 两层构建布局；布局由 product 的相对路径决定，与 CPU 架构无关
oskm scan --workspace-root "$PWD" \
  --product generic_generic_arm_64only/general_all_phone_standard \
  --cpu-arch arm64 \
  --db KnowledgeBase/artifacts/device/knowledge.db

# 只要某个领域（依赖会自动补齐并先执行）
oskm scan --workspace-root "$PWD" --product wukong100 --db ... --only hdi

# 不做部件归属（取代旧的 --resolve-component false）
oskm scan --workspace-root "$PWD" --product wukong100 \
  --db ... --only services --without components

# 只重扫一个领域，复用库里已有的上游结果
oskm scan --workspace-root "$PWD" --product wukong100 \
  --db ... --only hdi --scan-id 1 --reuse-upstream

# 附带语义质量门禁
oskm scan ... --fail-on error
```

| 参数 | 说明 |
| --- | --- |
| `--workspace-root` / `--product` | 必填；`--product` 是 `out/` 下的相对产品路径，可为一层或两层 |
| `--cpu-arch` | 本次扫描的目标 CPU 架构，写入 `scans.cpu_arch`；省略时默认为 `arm64` |
| `--db` | SQLite 路径，默认 `out/knowledge.db` |
| `--only a,b` | 逗号分隔；**依赖自动补齐**，`--only hdi` 会先跑 components 和 services |
| `--without a,b` | 跳过某个依赖；下游看到"未选中"而非"失败"，静默不做对应步骤 |
| `--scan-id N` | 写进已有快照而非新建 |
| `--reuse-upstream` | 只跑 `--only` 指定的，信任库里已有的上游行（需配合 `--scan-id`） |
| `--fail-on none\|error\|warning` | 默认 none；见下方"两条独立的质量轴" |

下文所有 `{build_root}` 都指 `ScanRequest.build_root`：按 `product` 的路径段数自动选择 `out/{product}` 或 `out/{abi}/{device}`。采集器统一使用 `ctx.build`，不要自行拼接 `workspace/out/{product}`。

stdout 是一条 JSON 执行摘要（含每个采集器的 status / records / issues 与 `gate_passed`），stderr 逐条输出诊断。

### 构建系统集成

`packages/oskm/oskm_collect.py` 是 hb 在 `postTargetCompilation` 阶段调用的包装入口，输出到 `{build_output}/oskm/knowledge.db`：

```bash
python3 KnowledgeBase/packages/oskm/oskm_collect.py \
  --input out/rk3568 --target-cpu arm

# 两层布局：--input 为 out/{abi}/{device}，未显式给 --product 时推导为 {abi}/{device}
python3 KnowledgeBase/packages/oskm/oskm_collect.py \
  --input out/generic_generic_arm_64only/general_all_phone_standard \
  --target-cpu arm64
```

包装入口同时支持 `out/{product}` 与 `out/{abi}/{device}`：未显式给 `--product` 时，根据 `--input` 在 `out/` 下的层级推导产品路径。`--target-cpu` 写入 `scans.cpu_arch`；未提供时默认为 `arm64`。

ArkTS 不新增入口参数，直接从 `--workspace-root` 拼接以下工程路径：

| 用途 | 相对 workspace root 的路径 |
| --- | --- |
| SDK 声明源码 | `interface/sdk-js` |
| ohos-typescript 包 | `interface/sdk-js/build-tools/node_modules/typescript` |
| Node v18.20.1 | `prebuilts/build-tools/common/nodejs/node-v18.20.1-linux-x64/bin/node` |

ArkTS 扫描不依赖 PATH 中的 Node；依赖缺失或不符合锁定版本时明确失败。源码编码异常、引用歧义等会记录为 issue 并继续扫描。**退出码 4 表示扫描已完成落库但数据 degraded，不等于程序崩溃**；请结合 stdout 摘要和下方退出码表判断。当前工程的 ArkTS 存在 1 份坏编码声明文件，保留真实状态，不强行改为成功。详见 [ArkTS 使用说明](../oskm/collectors/arkts/README.md)和[验证报告](../oskm/collectors/arkts/validation.md)。

### 读取结果

结果只在库里。读取走 `ScanSession`（见下方 Python API），或直接用 SQL：

```bash
sqlite3 KnowledgeBase/artifacts/rk3568/knowledge.db \
  "SELECT s.scan_id, c.subsystem, s.name
     FROM services s
     JOIN components c ON c.id = s.component_id
     JOIN scans sc ON sc.id = s.scan_id
    WHERE s.scan_id = 1"
```

表结构即数据契约：`scans` / `collector_runs` / `issues` 三张框架表，加每个采集器自己的表。`scans` 保存产品、`cpu_arch`、工作区和起止时间；`cpu_arch` 默认 `arm64`。构建布局按 `product` 的相对路径自动探测，与 CPU 架构无关。结构约束（NOT NULL、CHECK、外键、唯一键去重）由建表语句保证，不再有独立的文档校验步骤。表结构变更不做自动迁移：schema 与当前查询层不匹配的旧库直接报错，需要重新扫描。

每张领域表有一个 `id` 代理主键（rowid 别名），跨表引用一律走 `id` 外键并带 `ON DELETE CASCADE`——`services.component_id → components.id`、`hdis.service_id → services.id` 等。业务键（如 `components(scan_id, name)`）降为 UNIQUE 约束。这样归属不会悬空（数据库直接拒绝），且一个 cfg 声明多个 service 时，设备声明能精确指向宿主的那一个。

### 快照管理

```bash
oskm scans --db ...              # 列出库内全部快照
oskm drop  --db ... --scan-id 1  # 删除一个快照（级联清空其全部行）
```

一个库可以存多次扫描（多产品、多版本），每行带 `scan_id`；未完成的扫描 `finished_at` 为 NULL，查询默认看不到。

### 一张 issues 表，两条独立的质量轴

采集器发现的一切都是 `issues` 行，用 `advisory` 列区分两类问题——**同一套存储、同一套字段（`path` + `pointer` + `severity` + `details`），只是回答的问题不同**：

| | `advisory = 0` | `advisory = 1` |
| --- | --- | --- |
| 含义 | 有东西**没读到或没解析成功**（文件缺失、JSON 损坏、归属索引不可用） | 读全读懂了，但**数据本身**可疑（取值越界、重名、悬空依赖、syscap 重复） |
| 体现为 | `status = degraded`，退出码 4 | `--fail-on` 按 severity 计数，退出码 5 |
| 影响 `inventory_complete()` | 是 | 否 |

两条轴互不干扰：一个重名服务不会让 HDI 认为 service 清单不完整，一个读不动的 cfg 也不会被当成"数据写错了"。查询时 `WHERE advisory = 0/1` 即可分开；发布文档里 `advisory` 只在为真时出现。

rk3568 实测：13 条扫描层问题 + 88 条 advisory。

退出码只反映**你要求扫描的**采集器；`status` 字段仍报告整次扫描的真实状态，所以依赖降级可见，但不会让一次健康的 `--only` 运行失败。

| 退出码 | 含义 |
| --- | --- |
| 0 | 完整且门槛通过 |
| 2 | 请求错误（参数非法、输入根缺失） |
| 3 | 资源上限、回调异常或写入失败 |
| 4 | 已落库但 degraded |
| 5 | 不满足 `--fail-on` 门槛 |
| 130 | 取消 |

degraded 优先于门槛失败：读不到比读到的可疑更严重。

## Python API

```bash
export PYTHONPATH="$PWD/KnowledgeBase/packages/oskm${PYTHONPATH:+:$PYTHONPATH}"
```

### 会话 API：跨域导航（推荐）

`ScanSession` 可以只连库工作，不需要源码树——这是给查询层（`cli/oskm_cli/`）准备的路径。

```python
from pathlib import Path
from oskm.core.db import Database
from oskm.core.models import ScanRequest
from oskm.core.runner import run
from oskm.core.session import ScanSession

store = Database('knowledge.db')
# 显式请求 arm32；或直接打开既有库
run(store, ScanRequest(Path.cwd(), 'rk3568', cpu_arch='arm'))
# 两层布局使用默认 arm64
run(store, ScanRequest(Path.cwd(), 'abi/device'))

with ScanSession.open(store) as session:
    session.collectors            # ('repos','components','args','install_modules',
                                 #  'component_links','services','hdi','sas','elf_modules',
                                 #  'ndk_headers')
    session.status                # complete / degraded / failed

    # unified model 导航：subsystem → component → service → {hdi, sas}
    for subsystem in session.subsystems():
        for component in subsystem.components():
            component.dependencies()        # deps.components 正向
            component.dependents()          # 反向引用
            component.attached()            # {'services': (...), 'hdi': (...)}

    service = session.service('system/etc/init/foundation.cfg')
    service.component()                      # 归属的 Component
    service.hosted('sas')                    # 该宿主进程下的 SA 声明
    service.install_module()                 # 安装这个 cfg 的构建目标

    # 安装清单：镜像路径 → 谁装的 → 属于哪个部件
    session.install_module('//base/foo:bar') # 按 GN label
    session.installed_at('system/lib/libfoo.z.so')   # 按安装路径，含目录安装回退
    session.owner_of('system/etc/init/foo.cfg')      # 直接到 Component

    session.records('services')              # 已发布记录
    session.document('hdi')                  # 完整发布文档（snapshot + 数组）
    session.issues('services')               # 该领域全部 issue
    session.sql('SELECT ... WHERE scan_id = ?', (session.scan_id,))   # 兜底
```

跨域关联在库里是 JOIN，不是记录内的副本：记录只存 `component_id` / `service_id` / `install_module_id` 外键，`component` 对象与 GN `label` 在读取时 JOIN 重建，所以单领域重扫不会留下过期副本。归属与 label 由 `install_modules` 统一解析一次，services / hdi / sas 不再各自解析安装清单。

### 单领域 API

旧的自由函数保留，内部走同一套 SQLite 路径，返回不可变 Result：

```python
from oskm.core.api import scan
from oskm.collectors.services.models import (
    ServiceScanRequest, ServiceFilter, ServiceAggregateRequest)
from oskm.core.models import FieldPredicate, PageRequest

result = scan('services', ServiceScanRequest(Path.cwd(), 'rk3568', cpu_arch='arm'))
result = scan('services', ServiceScanRequest(
    Path.cwd(), 'abi/device'))
with result.query() as query:
    page = query.list_services(ServiceFilter(
        fields=(FieldPredicate('ondemand', 'eq', True),)), page=PageRequest(limit=20))
    print(query.aggregate_services(ServiceAggregateRequest(group_by=('type',))))
# 语义质量问题是 advisory issue，和扫描层问题同在 snapshot['issues']
print([i for i in result.snapshot.get('issues', ()) if i.get('advisory')])
```

`scan(collector, request)` 是唯一的单领域入口（取代原先四份 `api.py`）：采集器名决定 Result 类型与记录字段，新增领域无需在这里加代码。

`ServiceScanRequest` 接受 `package_root`，以及统一的 `ScanLimits`（`file_bytes` / `total_bytes` / `input_files` / `tree_depth` / `tree_items`）。Result 中 Mapping 只读、数组为 tuple，小数用 Decimal；`to_dict()` 返回独立副本。

字段谓词使用原 cfg 字段名：`path` 由 `executable`/`args` 还原。支持 eq/in/contains/present/absent/is_null 与字段内 JSON Pointer；布尔与数字不同，缺省与 null 不同。`ServiceFilter` 支持 cfgs / partitions / types / components / subsystems / fields。分页默认 100、最大 1000，游标绑定结果与查询条件。聚合支持 partition、type、`field:<标量字段>`、label/component/subsystem，1～3 维。

## 数据契约

记录保留中文和精确数值：JSON 数字字面量按 `Decimal` 解析，存进 JSON 列时原样保留文本。两条相关约束：库里**禁用 `REAL` 列**（声明即报错），且 JSON 列**以 TEXT 存储**——SQLite 没有 JSON 类型，声明成 `JSON` 会落到 NUMERIC affinity，把文档 `3` 存成整数、`1.5` 存成 double，正是要防的精度损失。`session.records('services')` 返回的单条记录形如：

```json
{
  "cfg": "system/etc/init/example.cfg",
  "type": "sa",
  "name": "example",
  "executable": "/system/bin/sa_main",
  "args": [],
  "uid": "system",
  "label": "//bundlemanager/bundle_framework/services/bundlemgr:bundle_manager_service",
  "component": {"name": "bundle_framework", "subsystem": "bundlemanager", "manifest": "bundlemanager/bundle_framework/bundle.json"},
  "config": {"once": 0, "permission": []}
}
```

`snapshot` 层的 `product` / `cpu_arch` 来自 `scans` 表，`schema_version` / `scope` / `status` 来自 `collector_runs` 表，问题存在 `issues` 表。

- 原 cfg 实际存在的 `name/uid/gid/start-mode/ondemand` 提升到顶层，`path` 拆为 `executable=path[0]` 和 `args=path[1:]`。其余字段放进 `config`；没有额外字段则省略。
- 不补不存在的字段，保留 null、异常类型、未知字段、数组顺序及重复项。**键缺失与值为 null 是两回事**，往返后仍可区分。
- type 依据 `path[0]` 文件名分类为 sa / hdf / default；不可判断时省略。
- 同名、同内容和空 service 对象均保留，不生成 index 或 service_id。
- `component` 三字段均来自 components 采集器的真实记录，不是本领域自行推导。

其余领域说明见各采集器目录下的 `README.md` 和 `design.md`：
[services](../oskm/collectors/services/)、
[SystemAbility](../oskm/collectors/system_abilities/)、
[HDI](../oskm/collectors/hdi/)、
[components](../oskm/collectors/components/)、
[install_modules](../oskm/collectors/install_modules/)、
[ELF modules](../oskm/collectors/elf_modules/)、
[NDK headers](../oskm/collectors/ndk_headers/)、
[repos](../oskm/collectors/repos/)。

## 边界与验证

不解析 import、顶层 jobs、运行状态、最终生效配置或 SA 实现。来源是 cfg 安装目标归属，不是可执行程序归属。

每个采集器在一个事务内写入：中途失败不留部分行，快照保持未完成状态。`PRAGMA foreign_keys = ON` 在每个连接上启用，删除快照级联清空其全部行。重跑单个采集器会先删掉它在该快照下的旧行再写入，因此幂等。

```bash
python3 -m unittest discover -s packages/oskm/oskm/tests -v

# 产品级验收（需要真实 OpenHarmony 代码树）：跑一次全量扫描，
# 再按域看 collector_runs / issues。原 verify_rk3568.py 已于 2026-11-12 删除，
# 验收基线从 rk3568 换成 wukong100。
cd packages/oskm
python3.12 -m oskm.cli scan --workspace-root "$PWD"/<OH源码根> --product wukong100 \
    --db ../../artifacts/wukong100/knowledge.db
# 查询侧是**另一个入口**（两个产物没有共同命令）；源树里不用先构建：
DB=../../artifacts/wukong100/knowledge.db
export PYTHONPATH=cli
python3.12 -m oskm_cli --db "$DB" ask get_scan_info  # 各采集器 status/record_count/error
python3.12 -m oskm_cli --db "$DB" ask list_issues
```

验收脚本独立于扫描器重新实现一遍解析逻辑做交叉验证，不调用扫描器内部函数生成期望值。实测数据见各采集器目录下的 `validation.md`。
