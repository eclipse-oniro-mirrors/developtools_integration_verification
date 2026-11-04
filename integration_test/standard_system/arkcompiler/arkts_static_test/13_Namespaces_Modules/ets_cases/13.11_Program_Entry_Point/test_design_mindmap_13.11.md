# 13.11 Program Entry Point - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.11 Program Entry Point

## 概述

spec §13.11：程序入口点是 main() 函数。main() 可以是 `main(): void` 或 `main(): int` 或 `main(FixedArray<string>): void/int`。main() 签名错误 → compile-time error。main() 不可 overload。

## 规则要点

1. main(): void — 入口函数（无参数）
2. main(): int — 入口函数（返回int）
3. main() 签名错误 → compile-time error
4. main() 运行时执行
5. main(FixedArray<string>) 参数合法
6. main() 不可 overload → compile-time error
7. main() 返回类型可从 body 推断

## 测试点分类

### compile-pass（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_11_001_PASS_MAIN_VOID | main(): void入口 |
| 002 | NSM_13_11_002_PASS_MAIN_INT | main(): int入口 |
| 005 | NSM_13_11_005_PASS_MAIN_FIXED_ARRAY | main(FixedArray<string>)参数 |

### compile-fail（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_11_003_FAIL_MAIN_WRONG_SIGNATURE | main()签名错误 |
| 006 | NSM_13_11_006_FAIL_MAIN_OVERLOAD | main函数不可overload |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | NSM_13_11_004_RUNTIME_MAIN_EXEC | main函数运行时 |
| 007 | NSM_13_11_007_RUNTIME_MAIN_INFERRED_RETURN | main()推断返回类型 |

## 文件命名规范
- `NSM_13_11_YYY_{CATEGORY}_{DESCRIPTION}.ets`
