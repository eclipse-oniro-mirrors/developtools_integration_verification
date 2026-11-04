# 7.21.3 Prefix Increment — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

无 D 类 Spec 不一致。20/20 用例全部通过。

### 跨语言设计差异

1. **++ 操作符存在性**：ArkTS 和 Java 原生支持 ++；Swift 3 已移除
2. **返回值语义**：++x 返回新值 vs x++ 返回旧值（ArkTS 和 Java 完全一致）
3. **类型提升**：ArkTS ++byte 保持 byte；Java 提升为 int
4. **bigint 支持**：ArkTS 是唯一支持 ++bigint 的语言
5. **溢出处理**：ArkTS/Java 包装；Swift 默认 crash
6. **enum 检查**：ArkTS 编译时错误；Java 编译通过但无效

### 建议

- 当前实现完全符合 spec 规范
- 前置/后置递增返回值语义正确区分
- byte/short 类型保持和 bigint 支持是特殊优势
