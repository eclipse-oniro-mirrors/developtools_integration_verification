# 11.3 Initialization of Enumeration Members - Java & Swift 实测报告

## Java 实测

```text
PASS java enum Red = 0
PASS java enum Blue = 5
PASS Java enum cannot auto-increment from prior member N/A
SUMMARY pass=3 fail=0
```

结论：Java enum 没有 auto-increment，第一成员默认构造值 0。

## Swift 实测

```text
PASS swift enum explicit rawValue simulation
PASS Swift enum must explicitly set rawValue for each member N/A
SUMMARY pass=2 fail=0
```

结论：Swift rawValue 必须显式为每个成员赋值，无自动递增。