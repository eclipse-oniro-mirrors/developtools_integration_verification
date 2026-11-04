# 4.6 Variable and Constant Declarations - 测试设计思维导图

## 概述
Variable declarations (let) introduce named storage locations. Constant declarations (const) introduce named variables with mandatory explicit value. Both must have initial values before first usage.

## 子类型覆盖
> **注意**: 4.6.1~4.6.5 已拆分至独立子目录：
> - `4.6.1_Variable_Declarations/`
> - `4.6.2_Constant_Declarations/`
> - `4.6.3_Validity_of_Initializer/`
> - `4.6.4_Assignability_with_Initializer/`
> - `4.6.5_Type_Inference_from_Initializer/`

（父级 4.6 仅保留概述性文档，具体测试点见各子目录。）

## 文件命名规范
- NAM_04_06_YYY_{CATEGORY}_{DESCRIPTION}.ets（父级 4.6 用例）
- NAM_04_06_XX_YYY_{CATEGORY}_{DESCRIPTION}.ets（子节用例，XX=01~05，位于对应子目录）
