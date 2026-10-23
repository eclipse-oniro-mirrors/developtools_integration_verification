# HDI 扫描实现与验证报告

日期：2026-10-16。工程版本：0.5.0；HDI schema：1.0.0；services/SA 契约保持原版本。

## 1. 实现内容

- 独立 HCB 0.7 有界读取器，支持紧凑/对齐格式，校验头部、父子边界、字符串、数组、节点引用和输入预算。
- 按 manager/host/device/node 提取完整设备属性；输出 snapshot/hdis。四个基础字段提升，其余属性放 config；hostName 成为 process。
- 复用 services API，以 hdf_devhost 的 -n 确认 cfg/name 引用；不按 init 名字补宿主。
- 根据唯一安装库及完整 dest 确认 label，与最近 bundle 核对 part/subsystem；缺失和歧义保留声明并报告。
- 实现不可变结果、详情/条件查询/分页/聚合、独立质量检查、薄 CLI；公共持久化新增固定 hdis 域，沿用格式化 JSON 和原子覆盖。

代码位于 `packages/oskm/oskm/collectors/hdi`。扫描器运行不依赖 hc-gen；测试夹具与产品验收使用它提供独立对照。未修改参考 deps_guard 或 HDF 源码。

## 2. 验证命令与结果

```bash
python3 -m unittest discover -s KnowledgeBase/packages/oskm/tests -q
python3 KnowledgeBase/packages/oskm/tests/verify_rk3568.py --workspace-root "$PWD"
```

**73 项测试通过：24 项 HDI、24 项 services、25 项 SA。**

HDI 测试覆盖紧凑/对齐独立夹具、各整数宽度、最大 uint64、数组、引号/换行、节点引用、坏头部/截断/越界/重复属性与节点/非法引用、预算与输入边界；另外覆盖字段无损布局、未知字段和元数据重名、重复声明、空 manager、单文件原子提取、宿主匹配/歧义/残缺参数和服务索引、缺库/多库/非 ELF/目录链接/文件越界、库目录读失败、安装目标/部件冲突及回退。

API/持久化测试验证只读结果、组合筛选、非法查询、聚合、跨 JSON/API 内容和游标、格式化、默认覆盖、取消/失败保留旧文件、输出输入冲突、离线结构校验与 CLI 退出码。

[独立二进制夹具](../../../tests/fixtures/hdi/README.md)由当前 hc-gen 从保存的源 HCS 生成，测试不依赖自写编码器与读取器互相印证。产品验收对反编译结果只解析已确认的设备层七个标量属性，避开 host.initconfig 的引号转义缺陷；逐条独立核对宿主和实现归属。

## 3. rk3568 验收

| 项目 | 结果 |
| --- | ---: |
| HCB 字节数 / 版本 | 37974 / 0.7 |
| 全文件 moduleName / manager 内设备声明 | 61 / 57 |
| 声明宿主 / 关联成功的声明 | 27 / 57 |
| 不同 serviceName / moduleName | 57 / 57 |
| 原始设备属性种类 | 7 |
| policy=2 / preload=0 / preload=2 | 57 / 38 / 19 |
| 唯一安装库及完整归属 | 46 |
| 归属 part / subsystem | 26 / 1（hdf） |
| 安装库缺失 | 11 |
| snapshot.status / issue 类型 | degraded / 11 条 LIBRARY_UNMATCHED |
| 可选初始字段质量诊断 | 0 |
| CLI --fail-on error 退出码 | 4（产物已发布，关联不完整） |

11 条缺失与[需求调查清单](./hdi-scanner-requirements.md)完全一致，未减少声明数量或代填归属。全部 57 条的七个设备属性与 hc-gen 对照相等；全部宿主引用与独立 services 结果一致；46 条安装文件有 ELF magic，安装行与最近 bundle 一致，label 不含工具链。

调查时只提到“不跟随目录链接”；实现明确将 package/root/lib → /system/lib、root/etc → /system/etc 等别名排除在物理枚举范围之外，不因此把整个库索引标为不完整。真实目录读失败仍使唯一匹配不能确认。此行为已补入设计和测试。

## 4. 产物

| 格式 | 字节数 | 文件 |
| --- | ---: | --- |
| 格式化 JSON | 42275 | [hdis.json](../../../../../artifacts/hdi/rk3568/hdis.json) |

同一内容的内存、JSON：57 条详情与宿主引用、过滤、按进程/部件/子系统/服务/预加载聚合及游标均一致。JSON 文件与 API重复写入，CLI 再扫描覆盖 JSON，离线验证通过。目录只有上述两个文件，产物由 Git 忽略。

## 5. 既有域回归

已在临时目录运行两个既有产品验收脚本，均通过并清理回归产物：

- services：148 cfg、164 声明、159 个名称；类型 sa=104、hdf=28、default=31、缺省=1。JSON 193021/180224 字节。既有两条来源 issue 和两条质量 error 保持不变，原质量门槛仍返回 5。
- SA：104 profiles、165 SA、113 part、47 subsystem，complete；JSON 121692/102400 字节，门槛返回 0。

共享改动限于新增 HDI 持久化分派；services 和 SA 采集/查询契约未改变。

## 6. 边界

这是当前 rk3568 静态产物验收，不证明缺库声明对应运行失败，也不证明唯一文件就是运行时加载文件。HDI IDL、接口版本、完整 linker namespace、其他 HCB 版本和运行态分析未实施。离线产物校验验证结构，不重新访问工作区核实来源。
