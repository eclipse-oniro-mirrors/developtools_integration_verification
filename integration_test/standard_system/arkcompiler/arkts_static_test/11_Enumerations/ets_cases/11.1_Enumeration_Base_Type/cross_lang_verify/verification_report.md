# 11.1 Enumeration Base Type - Java & Swift 实测报告

## Java 实测

```text
PASS java enum ordinal 0,1,2 analog to int auto-increment
PASS java enum explicit int values
PASS Java has no compile-time base type inference N/A
SUMMARY pass=3 fail=0
```

结论：Java enum ordinal 模拟 int 自动递增，但无编译期基类推断。

## Swift 实测

```text
PASS swift Int rawValue
PASS swift String rawValue
PASS Swift rawValue: is explicit, no compile-time inference N/A
SUMMARY pass=3 fail=0
```

结论：Swift rawValue 需显式赋值，无推断机制。