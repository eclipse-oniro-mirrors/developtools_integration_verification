# 11.2 Enumeration with Explicit Base Type - Java & Swift 实测

## Java 实测

```text
PASS java enum explicit byte analog
PASS java enum explicit int analog
PASS Java enum base type must be explicit via constructor, not compile-time N/A
SUMMARY pass=3 fail=0
```

## Swift 实测

```text
PASS swift explicit Int rawValue
PASS swift explicit Double rawValue
PASS Swift rawValue is always explicit but limited to Int/String/Double N/A
SUMMARY pass=3 fail=0
```

ArkTS 是所有三种语言中显式基类支持最丰富的（byte~double + string）。