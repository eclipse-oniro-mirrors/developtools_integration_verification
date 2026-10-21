# SA 扫描实现与验证报告

日期：2026-10-16。工程版本：0.4.0；SA schema：1.0.0；services schema：3.0.0。

## 1. 实现内容

- `scan_sas` 只读扫描安装 profile，保留全部 SA 元素原字段，返回 snapshot/sas 精简结构。
- 复用 services API，以 sa_main 的 args[0] 精确关联宿主，输出最小 cfg/name 引用。
- 读取源安装清单、目标 info、单 SA 构建 profile，核对原对象后解析去工具链 label 和声明部件；通过最近 bundle 获取子系统，缺失时才启用模块元数据回退。
- 支持只读详情、组合字段过滤、分页、声明聚合及独立质量检查。
- JSON 共用逻辑模型与查询，新增固定 sas 表分支；沿用格式化 JSON、原子覆盖及失败/取消清理。
- 提取公共 label/bundle、精确比较、谓词和游标函数。services 保留独立采集与查询逻辑，原输出契约未变。

新增代码位于 `packages/oskm/oskm/collectors/system_abilities`；context/models/validation 分开保存请求上下文、只读契约和离线布局校验，避免将 SA 分支塞入 services。

## 2. 验证命令

从 OpenHarmony 工程根执行：

```bash
python3 -m unittest discover -s KnowledgeBase/packages/oskm/tests -q

python3 KnowledgeBase/packages/oskm/tests/verify_rk3568.py --workspace-root "$PWD"

python3 KnowledgeBase/packages/oskm/tests/verify_rk3568.py --workspace-root "$PWD"
```

**49 项测试通过：25 项 SA 测试、24 项既有 services 测试。** SA 测试覆盖：

- 原字段重建、元数据同名冲突、精确数值、只读 API、重复 ID/声明保留。
- 非 SA JSON 排除、空目录、损坏 JSON/数组、被服务引用的空 profile、输入数量和大小限制、路径越界及目录读取失败。
- args[0] 匹配、非首参数排除、自定义启动器无匹配、重复服务、process 名称冲突和不完整服务索引。
- 工具链去除与一致证据合并、多目标歧义、源配置过期、缺失清单、目标元数据冲突、单 SA 输入约束、非法 label。
- 最近 bundle、部件冲突、精确部件回退及子系统冲突；中间 SA 不进入安装清单。
- 跨 JSON/API 的详情、查询与分页，原始类型/缺省/null 区分，聚合计数和非法查询。
- 格式校验、结果数组顺序、默认覆盖、失败保留旧文件、取消/回调处理和 CLI 质量门槛。

产品验收脚本另外逐条读取原始 profile 和逐 SA 构建输入，独立核对宿主、部件与子系统；不只检查扫描器自报的摘要。

## 3. rk3568 全量验收

| 项目 | 结果 |
| --- | ---: |
| SA profile / 正常排除的其他 JSON | 104 / 10 |
| SA 声明 / 不同 ID | 165 / 165 |
| 原始 SA 字段种类 | 18 |
| 不同声明进程 / init 宿主服务 | 104 / 104 |
| 精确宿主关联 / 单 SA 源匹配 | 165 / 165 |
| 源安装清单记录 | 131 |
| 声明归属部件 / 子系统 | 113 / 47 |
| run-on-create=true / distributed=true | 85 / 10 |
| snapshot.status / issues | complete / 无 |
| 独立初始质量规则诊断 | 0 |
| CLI --fail-on error 退出码 | 0 |

重点样本通过：401 和 4606 都在 foundation 进程，但分别归属 bundle_framework/bundlemanager 与 window_manager/window；8300 的声明归属为 netmanager_ext/communication，不依赖动态库安装匹配。

完整原 SA 元素可由四个顶层原字段与 config 无损还原。两种文件格式与内存 API 的 165 条详情、service 引用、过滤、按部件/进程/服务等维度聚合和游标全部一致。

## 4. 产物

| 格式 | 大小（字节） | 文件 |
| --- | ---: | --- |
| JSON，两空格缩进 | 121692 | [sas.json](../../../../../artifacts/system-abilities/rk3568/sas.json) |

JSON 文件与 API均验证默认覆盖；CLI 再次扫描并覆盖 JSON 后校验有效。目录只有上述两个文件，无必要旁车或 journal。本地产品产物被 Git 忽略，测试可在原路径重复运行。

## 5. services 回归

已有 services 产品验收通过：148 个 cfg、164 条服务、159 个名称、29 种字段；类型保持 sa=104、hdf=28、default=31、缺省=1。默认 JSON 大小仍为 193021/180224 字节。

来源模式仍报告此前已有的 hdcd 无安装匹配及 msdp_musl 子系统冲突；原有两条质量 error 未变化，门槛返回 5。此类 services 输入问题不是 SA 验收失败；SA 只复用不启用 cfg origin 的 services 采集结果。

services 回归产物在临时目录执行并清理，未增加工作区快照。

## 6. 范围限制

本次验证的是当前编译产物中的静态声明和构建元数据关联，不证明 SA 已运行或已注册，不保证未测试产品与其他构建形态的覆盖率。

无源码包、非 sa_main 启动器、构建链不完整或源/安装对象不同会报告缺失或冲突，不用宿主或库归属代填。产物离线校验不重新访问工作区，也不检测所有语义篡改。API 仍完整加载内存，MCP 传输和运行态分析未实施。
