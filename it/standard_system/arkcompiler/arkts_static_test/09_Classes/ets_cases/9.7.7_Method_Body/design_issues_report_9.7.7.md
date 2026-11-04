# 9.7.7 Method Body - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-19
**测试用例数：** 13（4 compile-pass + 7 compile-fail + 2 runtime）
**目的：** 通过用例执行（编译期 + 真实运行时）+ 跨语言对比，识别 ArkTS 方法体设计

---

## 一、与业界静态语言的差异点

**无新发现的设计问题。**

9.7.7 章节用例执行 100% 通过，未触发任何编译器异常或语义不符合预期行为。

---

## 二、符合ArkTS spec的语言设计差异

| 验证点 | 用例 | 状态 |
|-------|------|------|
| abstract 方法允许无体（仅分号） | compile-pass | ✅ |
| void 方法允许无 return 语句 | compile-pass | ✅ |
| void 方法允许仅有 `return;` | compile-pass | ✅ |
| 非 void 方法所有条件分支均有 return | compile-pass | ✅ |
| throw 可替代 return 确保路径终结 | compile-pass | ✅ |
| try-catch 两路均有 return | compile-pass | ✅ |
| 循环内 return + 循环后兜底 return | compile-pass | ✅ |
| abstract 类中具体方法各路径覆盖 return | compile-pass | ✅ |
| 非 void 方法 if 无 else 分支缺少 return 拒绝 | compile-fail (009/017/024) | ✅ |
| void 方法禁止 `return <value>` | compile-fail (015/032) | ✅ |
| native 方法必须为空体（分号） | compile-fail (016) | ✅ |
| 非 abstract 非 native 方法禁止空体 | compile-fail (018) | ✅ |
| abstract 方法禁止带有 block 体 | compile-fail (009) | ✅ |
| 复杂控制流运行时多路分支计算 | runtime (021) | ✅ |
| 循环累积计算（阶乘）运行时验证 | runtime (033) | ✅ |

---

## 三、值得关注的设计观察

### 观察 A：方法体完备性检查设计严格 ⭐ DESIGN

**spec §9.7.7 要求：** 非 void 方法必须在所有可能执行路径上均有 return 语句（或等效的 throw 终结路径）。

**用例体现：** compile-fail 目录下 009、017、024 精准捕获了 if 无 else 分支、for 循环可能不执行等路径遗漏场景。

**对比：**
| 语言 | 方法体返回值完备性检查 |
|------|----------------------|
| ArkTS | ✅（编译期严格检查所有路径） |
| Java | ✅（编译期检查，但允许无 else 的 if 后有额外 return 兜底） |
| TypeScript | ⚠️（仅在 strict 模式下有限检查） |
| Swift | ✅（编译期严格检查） |

**评价：** ArkTS 方法体返回值完备性检查与 Java/Swift 对齐，属于成熟语言的必备设计。编译期即可捕获运行时可能漏 return 的隐患。

### 观察 B：void 方法与 return 值严格分离 ⭐ DESIGN

**spec §9.7.7 明确：** void 返回类型的方法禁止 `return <value>`，无论返回值类型（int、string、bool 等）。

**用例：** CLS_09_07_015、032

**对比：**
| 语言 | void 方法中 return 值行为 |
|------|------------------------|
| ArkTS | ❌ 编译错误（严格禁止） |
| Java | ❌ 编译错误（严格禁止） |
| TypeScript | ⚠️ 允许但可能产生 undefined 行为 |

**评价：** ArkTS 在此设计上与 Java 一致，保持严格类型安全，优于 TypeScript 在此场景的宽松处理。

### 观察 C：native / abstract 方法体约束分工明确 ⭐ DESIGN

**spec §9.7.7 对方法体形式做了精确的三类约束：**

| 方法类型 | 允许的体形式 |
|---------|-----------|
| abstract | 仅分号（无体） |
| native | 仅分号（空体） |
| 普通方法 | 必须有 block 体 |

**用例：** compile-fail (016/018/009)

**评价：** 三种方法修饰符的方法体约束分工明确、互不混淆，编译器严格执行，设计清晰。

---

## 四、跨章节差异点

**无重现。** 9.7.7 章节执行 100% 通过，未触发已知设计问题。

---

## 五、差异分类总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 语言差异 | 0 | - |
| 设计观察 | 0 | - |
| 设计观察 | 3 | A、B、C |

---

## 六、跨语言对比结论

| 维度 | 评价 |
|------|------|
| 与 spec 一致性 | ⭐⭐⭐⭐⭐（执行 100% 通过） |
| 设计严密性 | ⭐⭐⭐⭐⭐（返回值路径检查严格、三种方法体约束分明） |
| void/return 分离 | ⭐⭐⭐⭐⭐（严格类型安全，与 Java 对齐） |
| 跨语言对比 | ArkTS = Java = Swift > TypeScript |

---

## 七、累积发现汇总（含 9.7.1 ~ 9.7.7）

| 严重性 | 总数 | 来源章节 |
|-------|------|---------|
| 编译器待完善 | 0 | - |
| 语言差异 | 0 | - |
| 设计观察 | 0 | - |
| 设计观察 | 3 | 9.7.7: 方法体完备性检查 / void 严格分离 / native/abstract 体约束 |

---

## 八、改进建议

无新建议。

9.7.7 章节方法体设计成熟，编译器对返回路径完备性、void 严格分离、以及 native/abstract 方法体约束均实现精准，与 Java/Swift 主流静态类型语言保持一致，无明显设计缺陷。
