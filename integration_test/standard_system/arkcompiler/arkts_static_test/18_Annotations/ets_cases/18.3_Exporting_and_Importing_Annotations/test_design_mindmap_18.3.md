# 18.3 Exporting and Importing Annotations - 测试设计思维导图

## 概述

参考 ArkTS Static Language Specification 第 18.3 节。

规则：
- 注解可用 `export @interface` 导出
- 支持 `import * as ns from "./a"` 限定名导入
- 支持 `import { MyAnno } from "./a"` 非限定名导入
- `import type` 导入注解 → 编译错误
- `export default` 注解 → 编译错误
- `import default` 注解 → 编译错误
- Rename in export/import → 编译错误

## 子规则覆盖

### compile-pass（多文件）
- 导出 + 限定名导入使用
- 导出 + 非限定名导入使用

### compile-fail（单文件）
- `import type` 导入注解
- 带重命名的 import
- `export default`
- default import

## 命名规范
- `ANN_18_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`
- 模块文件：`ANN_18_03_MOD_{NAME}.ets`
