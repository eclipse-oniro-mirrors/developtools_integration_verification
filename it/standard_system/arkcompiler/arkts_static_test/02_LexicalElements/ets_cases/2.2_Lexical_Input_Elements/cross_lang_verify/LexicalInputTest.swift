/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
// Swift Runtime Test - 对应 LEX_02_02 词法输入元素
// 测试因子checklist: 局部/全局书写、参数上下文、控制流中的空白和注释
// 覆盖 11 个 runtime 测试场景 (019-029)

import Foundation

// 全局变量
var 全局值: Int = 100

// 019: 空白符不影响算术运算结果
func whitespaceArith() -> Int {
    let a = 10 + 20  // 空格分隔
    let b = 30 + 40  // Tab 分隔
    let c = 50 +     // 换行分隔
            60
    return a + b + c
}

// 020: 注释不影响变量值
func commentNoEffect() -> Int {
    let x = 10 // 这是注释
    let y = 20 /* 这是多行注释 */
    return x + y
}

// 021: 多行表达式结果
func multiLineExpr() -> Int {
    let result = 10 +
                 20 +
                 30
    return result
}

// 022: 连续空行不影响语句
func consecutiveEmptyLines() -> Int {
    let a = 10

    let b = 20


    let c = 30


    return a + b + c
}

// 023: 表达式内注释
func commentInsideExpr() -> Int {
    let result = 10 + /* 中间注释 */ 20
    return result
}

// 024: 换行分隔多条语句
func lineSepMultiStmt() -> Int {
    let a = 10
    let b = 20
    let c = 30
    return a + b + c
}

// 026: 局部/全局作用域
func 局部计算() -> Int {
    let 局部值: Int = 200
    return 局部值 + 全局值 // 行末中文注释
}

// 027: 参数上下文
func 参数计算(_ 输入: Int) -> Int {
    return 输入 + 全局值
}

// 028: Unicode 在注释中
func unicodeInComments() -> Int {
    var 值 = 10 // 中文注释
    值 += 20 // Japanese: 日本語コメント
    值 += 30 // Korean: 한국어 주석
    return 值
}

// 029: 控制流中的空白和注释
func controlFlowWhitespace() -> Int {
    var 总和 = 0
    for i in 0..<5 /* for注释 */ {
        总和 += i
    }

    var 计数 = 0
    while 计数 < 3 /* while条件注释 */ {
        总和 += 计数
        计数 += 1
    }

    if 总和 > 10 /* 条件注释 */ {
        总和 *= 2
    }

    return 总和
}

// 计算类
class 计算类 {
    var 增量: Int = 1
    func 计算(_ 输入: Int) -> Int {
        return 输入 + 增量 + 全局值
    }
}

@main
struct Main {
    static func main() {
        print("=== Swift Lexical Input Test ===")
        print("")

        var totalAssertions = 0

        // 019: 空白符不影响算术运算结果
        let r19 = whitespaceArith()
        assert(r19 == 210, "019: whitespace arith failed, got \(r19)")
        totalAssertions += 1
        print("[Swift] 019 Whitespace arithmetic: PASSED (\(r19))")

        // 020: 注释不影响变量值
        let r20 = commentNoEffect()
        assert(r20 == 30, "020: comment no effect failed, got \(r20)")
        totalAssertions += 1
        print("[Swift] 020 Comment no effect: PASSED (\(r20))")

        // 021: 多行表达式结果
        let r21 = multiLineExpr()
        assert(r21 == 60, "021: multi-line expr failed, got \(r21)")
        totalAssertions += 1
        print("[Swift] 021 Multi-line expression: PASSED (\(r21))")

        // 022: 连续空行不影响语句
        let r22 = consecutiveEmptyLines()
        assert(r22 == 60, "022: consecutive empty lines failed, got \(r22)")
        totalAssertions += 1
        print("[Swift] 022 Consecutive empty lines: PASSED (\(r22))")

        // 023: 表达式内注释
        let r23 = commentInsideExpr()
        assert(r23 == 30, "023: comment inside expr failed, got \(r23)")
        totalAssertions += 1
        print("[Swift] 023 Comment inside expression: PASSED (\(r23))")

        // 024: 换行分隔多条语句
        let r24 = lineSepMultiStmt()
        assert(r24 == 60, "024: line sep multi stmt failed, got \(r24)")
        totalAssertions += 1
        print("[Swift] 024 Line separator multi-stmt: PASSED (\(r24))")

        // 026: 局部/全局作用域
        let r26 = 局部计算()
        assert(r26 == 300, "026: scope variations failed, got \(r26)")
        totalAssertions += 1
        print("[Swift] 026 Scope variations: PASSED (\(r26))")

        // 027: 参数上下文
        let r27 = 参数计算(50)
        assert(r27 == 150, "027: param context failed, got \(r27)")
        totalAssertions += 1
        print("[Swift] 027 Parameter context: PASSED (\(r27))")

        // 028: Unicode 在注释中
        let r28 = unicodeInComments()
        assert(r28 == 60, "028: unicode in comments failed, got \(r28)")
        totalAssertions += 1
        print("[Swift] 028 Unicode in comments: PASSED (\(r28))")

        // 029: 控制流中的空白和注释
        let r29 = controlFlowWhitespace()
        assert(r29 == 26, "029: control flow whitespace failed, got \(r29)")
        totalAssertions += 1
        print("[Swift] 029 Control flow whitespace: PASSED (\(r29))")

        // 类实例测试
        let 实例 = 计算类()
        let r30 = 实例.计算(50)
        assert(r30 == 151, "Class method test failed, got \(r30)")
        totalAssertions += 1
        print("[Swift] Class method: PASSED (\(r30))")

        print("")
        print("=== Swift Lexical Input Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
