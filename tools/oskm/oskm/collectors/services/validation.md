# Services 精简实现与验证报告

日期：2026-10-15。扫描器 0.3.0；schema 3.0.0。

本报告覆盖最新精简契约的实际实现及本轮验证；不沿用原完整模型的验收结论。

## 1. 实现结果

- 扫描直接生成 snapshot/services 两个逻辑根；所有原 service 字段保留，五个原名基础字段提升，path 拆为 executable/args，其余放 config。不生成 index、ID、逐字段状态表、证据图或重复原文。
- 自动发现全部 etc/init 目录，按 cfg 路径、原声明顺序返回；空对象、重复对象与字段异常原值均保留。
- 类型只由 path[0] 的文件名判断；来源默认关闭，启用后只保留去工具链 label、part、subsystem。
- 删除 manifest、GN/生成链解析、来源候选、内容哈希和证据归档逻辑；移除高级扫描参数，不提供旧模型兼容层。
- 扫描、来源解析、记录布局、查询、按需质量分析、持久化各自独立。JSON、内存结果共用查询与校验；JSON 默认两空格缩进换行，已有文件默认原子覆盖。
- 查询支持位置详情、原字段谓词、类型/来源过滤、分页、服务或单数组子项聚合。位置不进入服务对象；同内容声明不去重。

生产 Python 源码（oskm，含注释/空行，不含测试）由 2225 行减至 1163 行；主要减少来自旧实体模型、证据与来源链路的删除。

## 2. 验证命令与结果

从 OpenHarmony 工程根执行：

```bash
python3 -m unittest discover -s KnowledgeBase/packages/oskm/tests -q

python3 KnowledgeBase/packages/oskm/tests/verify_rk3568.py --workspace-root "$PWD"
```

合成测试 **24 项通过**。覆盖 path 拆分、空参数、异常 path 保留、拆分布局校验、原字段可逆布局、元数据同名冲突、精确小数、大整数、缺省/null、数组及重复声明、未知分区/嵌套目录、空根、读取限制和符号链接边界、目录读取失败、进程分类、工具链合并、安装歧义、残缺索引、最近 bundle 与归属冲突、字段查询、位置句柄、分页、聚合分母、JSON 结构校验、JSON 两空格缩进及精度保持、JSON 文件与 API默认原子覆盖、失败保留旧文件、取消清理、回调错误和 CLI 退出码。

产品集成验收退出 0，逐条还原并比较全部原 cfg service 对象；分别验证默认模式和来源模式的 JSON/API 服务详情、来源、查询、聚合与游标一致。CLI 的 --fail-on error 返回 5，发布的文件仍可校验。

验收脚本仅留下默认 JSON 文件；来源模式及质量门槛的临时产物自动清理。最后一次回归也使用临时目录，不增加工作区快照。重复执行同一输出路径会原子覆盖已有文件。本轮另连续两次对同一临时目录执行完整产品验收，两次均成功。

## 3. rk3568 数据与大小

| 指标 | 实测 |
| --- | --- |
| cfg / service 声明 / 不同名称 | 148 / 164 / 159 |
| 实际原始字段种类 | 29 |
| sa / hdf / default / 无法分类 | 104 / 28 / 31 / 1 |
| system / vendor / updater / eng_system 服务数 | 133 / 27 / 3 / 1 |
| 默认采集状态 | complete |
| 启用来源的服务覆盖 | 163 / 164 |
| 启用来源的采集状态 | degraded，2 条 issues |
| 按需质量诊断 | 2 error、9 warning |

| --- | ---: | ---: |
| 默认，不采集来源 | 193021 | 180224 |
| metadata 来源 | 222556 | 200704 |

本轮 path 拆分、JSON 格式化与默认覆盖后的验收在临时目录执行，产物已自动清理。历史 compact-verified 文件属于旧布局，不作为当前格式样例；需要保留新产物时使用上述命令并指定输出目录。本地产物被 Git 忽略。

两条来源问题：

- `eng_system/etc/init/hdcd.cfg`：ORIGIN_UNMATCHED。没有借用 system 分区同名配置的来源。
- `system/etc/init/msdp_musl.cfg`：ORIGIN_SUBSYSTEM_CONFLICT。保留 label、part，省略存在冲突的 subsystem。

bootanimation 通过最近的 graphic_2d/bundle.json 得到 graphic_2d/graphic；hdf_devhost 的产品目标没有父级 bundle，以匹配模块记录补充 product_rk3568/product_hihope。

质量诊断中的两条 error 是 telecom 的 apl 类型异常、device_usage_statistics_service 缺 path；9 条 warning 对应重复名称声明。原声明均保留，字段质量问题不使默认采集降级。

## 4. 当前边界

API 打开产物后完整加载内存，默认文件读取预算 512 MiB；未实现流式数据库查询或建立峰值内存指标。导出不回读工作区。

服务表示 init 声明，不表示实际运行进程或最终配置。来源表示当前输入中 cfg 安装目标的归属，不证明历史构建一致性；不执行 GN、repo 或生成器。内部验证检查结构、路径、类型、来源布局及顺序，不提供真实性签名或完整语义篡改检测。

字段规则独立保留，按需分析，不写入基础产物；当前标记未核实语义的规则不参与质量门槛。MCP 传输、跨快照比较、运行态分析及新服务推荐尚未实施。
