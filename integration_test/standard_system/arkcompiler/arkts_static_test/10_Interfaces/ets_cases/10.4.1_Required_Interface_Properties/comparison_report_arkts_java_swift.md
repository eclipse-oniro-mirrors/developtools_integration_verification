# 10.4.1 Required Interface Properties - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Required Interface Properties（必需接口属性）定义实现类必须实现的属性。ArkTS和Swift原生支持接口属性，Java接口不支持属性声明。

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 必需属性 | ✅ `readonly` / 读写 | ❌ 仅方法 | ✅ `{ get }` / `{ get set }` |
| 实现方式 | 字段或getter/setter | getter/setter方法 | computed property/stored property |

## 核心结论

ArkTS和Swift均原生支持接口必需属性。Java需要用getter/setter方法模拟，语法差异大。

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
