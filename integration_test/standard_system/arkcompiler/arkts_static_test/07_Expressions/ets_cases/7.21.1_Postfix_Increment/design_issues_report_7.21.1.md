# 7.21.1 Postfix Increment — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

无 D 类 Spec 不一致。20/20 用例全部通过。

### 跨语言设计差异

1. **++ 操作符存在性**：ArkTS 和 Java 原生支持 `++`；Swift 3 已移除该操作符（认为易混淆），需 `x += 1` 手动模拟

2. **类型提升**：ArkTS 的 byte++/short++ 保持原类型（不提升）；Java 的 byte++ 结果提升为 **int**

3. **bigint 支持**：ArkTS 是唯一支持 bigint 自增的语言（bigint++）；Java BigInteger 不可变不支持 ++；Swift 无 bigint

4. **溢出处理**：ArkTS 和 Java 的整数溢出采用包装语义（wrap）；Swift 默认整数溢出是运行时 crash（Illegal instruction），需 `&+` 溢出运算符

5. **enum 检查**：ArkTS 的 enum++ 直接报编译时错误（enum 不是数值类型）；Java 编译通过但操作无效（enum 是引用类型）；Swift 无 ++ 不适用

6. **char**：Java 支持 char++（char 是数值类型）；ArkTS char 缺乏字面量创建方式，未测试

### 建议

- 当前实现完全符合 spec 规范
- byte/short 类型保持是优于 Java 的设计（减少不必要的类型转换）
- bigint 支持 ++ 是特殊优势，建议保持
- enum++ 编译时错误优于 Java 的静默无效操作
- 溢出包装语义合理，与 Java 一致
