# 8.10 break 语句 测试设计思维导图

## 一、规格说明

**语法**: `breakStatement: 'break' identifier?`

**语义**:
- **不带标签**: 跳出最内层的 `while` / `do` / `for` / `for-of` / `switch` 语句
- **带标签**: 跳出包含该标签的封闭语句（必须是 loopStatement 或 switchStatement）
- **编译时错误**:
  - `break` 出现在 loopStatement 或 switchStatement 外部
  - `break` 的标签不匹配任何封闭语句的标签
  - `break` 的标签指向非循环/非 switch 的标记语句

**规范引用**: STATEMENTS.md -- "If a break statement is used outside a loopStatement or a switchStatement, then a compile-time error occurs."

## 二、核心规则

### 无标签 break 的合法上下文
| 上下文 | 示例 |
|--------|------|
| while 循环 | `while (cond) { if (x) break; }` |
| do-while 循环 | `do { if (x) break; } while (cond);` |
| for 循环 | `for (let i = 0; i < n; i++) { if (x) break; }` |
| for-of 循环 | `for (let v of arr) { if (x) break; }` |
| switch 语句 | `switch (x) { case 1: ... break; }` |
| 深层嵌套（3层+） | 最内层 `for` 中的 break 只跳出最内层 |

### 带标签 break 的合法上下文
| 场景 | 示例 |
|------|------|
| 2层嵌套，跳出外层 | `outer: while (...) { while (...) { break outer; } }` |
| 3层嵌套，跳出中间层 | `outer: for (...) { mid: for (...) { for (...) { break mid; } } }` |
| 3层嵌套，跳出最外层 | `outer: for (...) { for (...) { for (...) { break outer; } } }` |

### 编译时错误规则
| 错误场景 | 描述 |
|----------|------|
| break 在循环/switch 外部 | 顶层 break、if/else 深层嵌套中的 break（无外围循环） |
| break 标签不存在 | 标签名不匹配任何封闭语句的标签 |
| break 标签指向非循环/switch | 标签贴在块语句 `{}` 上而非循环/switch 上 |

## 三、测试点覆盖

### compile-pass（7个文件）

| 编号 | 测试点 | 描述 |
|------|--------|------|
| 001 | while 无标签 break | `while` 循环中使用无标签 `break`，跳出最内层 while |
| 002 | 嵌套循环带标签 break | 2层嵌套（`while` in `while`）中使用 `break outer`，跳出外层标记的循环 |
| 003 | for 无标签 break | `for` 循环中使用无标签 `break`，跳出 for 循环 |
| 004 | for-of 无标签 break | `for-of` 循环中使用无标签 `break`，跳出 for-of 循环 |
| 005 | switch 中 break | `switch` 语句中使用 `break` 跳出 case 块，防止 fallthrough |
| 006 | 3层嵌套无标签 break | 三层嵌套 `for` 循环中使用无标签 `break`，验证编译通过（只跳出最内层） |
| 007 | 3层嵌套带标签 break | 三层嵌套 `for` 循环中使用 `break mid`，跳出中间层标记的循环 |

### compile-fail（6个文件）

| 编号 | 测试点 | 描述 |
|------|--------|------|
| 006 | break 在循环/switch 外部 (if块) | `if (true) { break; }` -- break 不在任何循环/switch 内，产生编译错误 |
| 007 | break 标签不存在 | `while` 中 `break nonexistent_label;` -- 标签不匹配任何封闭语句 |
| 008 | break 标签指向非循环语句 | `lab: { break lab; }` -- 标签贴在块语句上而非循环/switch |
| 009 | break 在顶层 | 文件顶层直接写 `break` -- 无函数包裹，不在任何循环/switch 内 |
| 010 | 3层嵌套中 break 标签不存在（深层） | `outer: for (...) { for (...) { for (...) { break not_exist; } } }` -- 标签在深层嵌套中也不存在 |
| 011 | 深层嵌套 if/else 中 break | 三层 `if` 嵌套中的 `break`，无外围循环/switch，产生编译错误 |

### runtime（6个文件）

| 编号 | 测试点 | 描述 |
|------|--------|------|
| 009 | while 中 break 运行时行为 | 验证 `while` 中 `break` 在 `i==3` 时立即退出，`count` 和 `i` 值正确 |
| 010 | 带标签 break 跳出外层循环运行时 | 验证 `break outer` 跳出 `outer` 循环后，外层 `i=0`、内层 `j=2` 不变 |
| 011 | switch 中 break 防止 fallthrough 运行时 | 验证 `switch` 中 `break` 正确跳出，`result` 只为匹配的 case 值 |
| 012 | 3层嵌套无标签 break 运行时 | 验证无标签 `break` 只跳出最内层，外层（3次）和中层（9次）完整执行，内层体执行9次 |
| 013 | 3层嵌套带标签 break 跳出最外层运行时 | 验证 `break outer` 在 `i==1&&j==0&&k==0` 时直接跳出最外层，外层仅执行2次 |
| 014 | 3层嵌套带标签 break 跳出中间层运行时 | 验证 `break mid` 在 `j==2` 时跳出中层，外层执行3次完整，内层体总共33次 |

## 四、边界值与异常场景

### 边界值
- 空循环体中使用 break
- 深层嵌套（3层以上）中的无标签 break（只跳出最内层）
- 深层嵌套（3层以上）中的带标签 break（可跳出任意外层）
- break 后紧跟 return 语句
- 循环嵌套 switch，从 switch 中 break 不会跳出外层循环
- 标签贴在最外层、中层、内层的不同场景

### 异常场景
- break 出现在顶层（无任何函数包裹）
- break 在深层 if/else 嵌套中（无外围循环/switch）
- break 标签名拼写错误/不存在（包括深层嵌套场景）
- break 标签指向非循环的非 switch 标记块
- break 标签指向的封闭语句类型错误（if 标签、block 标签）

## 五、编号规划
- compile-pass: 001 ~ 007
- compile-fail: 006 ~ 011
- runtime: 009 ~ 014

（PASS/FAIL/RUNTIME 各自独立编号，存储在对应子目录 `compile-pass/`、`compile-fail/`、`runtime/` 中。）

## 六、文件命名规范
- 模板: `STMT_08_10_<NNN>_<TYPE>_<DESC>.ets`
- TYPE 取值: `PASS`, `FAIL`, `RUNTIME`
- NNN: 三位数字序号，每种类型内连续
- 注释块格式:
  ```
  /**
   * @id STMT_08_10_NNN_TYPE_DESC
   * @expect compile-pass|compile-fail|runtime
   * @section 8.10
   * @design <中文描述>
   * @note <英文说明>
   */
  ```
