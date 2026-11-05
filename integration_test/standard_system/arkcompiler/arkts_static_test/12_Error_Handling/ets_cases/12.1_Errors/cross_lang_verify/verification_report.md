# 12.1 Errors - Cross Language Verification Report

## ArkTS 实测

| 分类 | 总数 | 通过 | 失败 |
|---|---:|---:|---:|
| compile-pass | 5 | 5 | 0 |
| compile-fail | 3 | 3 | 0 |
| runtime | 4 | 4 | 0 |
| **总计** | **12** | **12** | **0** |

## Java 实测

```text
PASS java array OOB caught
PASS java catch type is Exception
PASS Java Exception system similar to ArkTS Error N/A comparison
SUMMARY pass=3 fail=0
```

## Swift 实测

```text
PASS swift array OOB caught via guard
PASS Swift Error protocol different from ArkTS Exception class N/A
SUMMARY pass=2 fail=0
```
