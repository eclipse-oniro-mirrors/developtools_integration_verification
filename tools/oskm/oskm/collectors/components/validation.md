# 部件扫描器实现与验证

日期：2026-10-16；工程版本：0.6.0；parts schema：1.0.0。

## 1. 完成内容

已实现 `collectors/components` 的单索引读取、源码定位、bundle/ohos.build 适配、诊断、不可变结果和查询；命令入口为 `scan_parts.py`。复用公共 JSON 持久化，并增加 parts 类型分派与验证。

逻辑根为 snapshot/parts。支持身份、源码清单路径、deps、build（包含完整 inner_kits 与 conditions）、features、syscap；不填充源码不存在的字段。查询包括单部件、筛选、分页、反向依赖与子系统计数。没有读取其他 out 过程文件，没有修改 build 仓或部件源清单。

## 2. 自动化验证

```bash
python3 -m unittest discover -s KnowledgeBase/packages/oskm/tests -q
python3 KnowledgeBase/packages/oskm/tests/verify_rk3568.py --workspace-root "$PWD"
```

- 单元测试 **93 项通过**：部件 20 项，已有 services/SA/HDI 共 73 项。
- 覆盖单一 out 输入、禁止摘要兜底、嵌套声明保真、只读结果、缺省/null/空集合、重复键、清单歧义、多部件共享 ohos.build、子系统差异、路径/符号链接边界、预算和缓存、取消及回调。
- 查询验证包括清单外依赖、重复依赖去重、第三方依赖谓词、分页游标跨格式复用、错游标拒绝和聚合计数。
- 持久化验证包括JSON 文件与 API、旧文件覆盖、失败/取消保留旧文件、输入保护、产物篡改拒绝以及 CLI 对其他领域产物的拒绝。
- 产品验收采用独立 JSON 解码与字段对照，并通过 Python 文件打开审计核对扫描的真实输入集合；不调用扫描器提取函数生成期望结果。

运行验证使用标准库；JSON Schema 文件提供给外部消费者，结构及跨字段约束由本项目 validation.py 校验，本次未依赖第三方 JSON Schema 引擎。

## 3. rk3568 结果

| 项目 | 实测结果 |
| --- | ---: |
| 部件 / 子系统 | 382 / 56 |
| bundle.json / ohos.build 输入 | 379 / 3 |
| 扫描实际打开的输入文件总数 | 383，每个文件一次 |
| 其中 out 下的输入打开次数 | 1，仅 components.json |
| 成功提取详情的部件 | 381 |
| 保留身份和路径、未合入详情的部件 | 1 |
| 诊断 | 1 error + 2 info |
| 扫描状态 / CLI 退出码 | degraded / 4 |
| JSON 文件大小 | 1,227,248 字节 |
| JSON 文件大小 | 978,944 字节 |


## 4. 唯一降级原因：重复的 features 字段

部件 `drivers_interface_display` 的 [bundle.json](../../../../../../drivers/interface/display/bundle.json) 在 component 内两次声明 features：第一处为空数组，第二处为非空特性列表。普通 JSON 解码通常保留后值；扫描器按详细设计拒绝静默覆盖，无法唯一解释该清单详情。

诊断为：

```json
{
  "code": "MANIFEST_JSON",
  "severity": "error",
  "part": "drivers_interface_display",
  "path": "drivers/interface/display/bundle.json",
  "pointer": "/component/features",
  "details": {"reason": "DUPLICATE_JSON_KEY"}
}
```

该记录仍保留 name、subsystem、manifest；deps/build/features/syscap 不从有歧义的清单导入。部件没有被删除，也没有用索引的 deps_components/innerapis 摘要替代。其他部件继续正常提取。

消除该降级需要由源码维护方确认预期 features 集合、合并为唯一属性后重新扫描。此次开发没有修改该源码文件，也未放宽重复键规则。

## 5. 两条正常子系统差异

| 部件 | components 索引子系统 | ohos.build 声明子系统 |
| --- | --- | --- |
| product_rk3568 | product_rk3568 | product_hihope |
| rockchip_products | device_rk3568 | rockchip_products |

两条均报告 SUBSYSTEM_DIFFERS/info，保留索引归属和已确认的源码详情；不触发 degraded 或 fail-on。扫描器没有读取构建白名单，也没有硬编码这两个部件的例外。

## 6. 范围与限制

- 元数据是当前源码声明，不能据此断言入口或接口已在本产品启用、编译、安装。
- 不读取产品 feature 生效值，不构建 GN 依赖闭包，不自动展开跨领域关联。
- 历史构建索引与当前 checkout 是否来自同一版本不能仅凭名称证明；本版不伪造版本一致结论。
- 当前以完整结果加载内存查询；规模由输入预算约束，不构建第二套 SQL 查询引擎。
