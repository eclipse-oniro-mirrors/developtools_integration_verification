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
// Swift Runtime Test - 对应 2.8 Operators and Punctuators 补充用例
// 测试重点：指数运算符、箭头函数、运算符优先级、更多复合赋值
// 覆盖 4 个新增 runtime 测试场景 (036-039)

import Foundation

@main
struct OperatorsNewRuntimeTest {
    static func main() {
        print("=== Swift Operators New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 036: 指数运算符
        let x1 = Int(pow(2.0, 3.0))
        assert(x1 == 8, "036: 2 ** 3 failed")
        totalAssertions += 1
        print("[Swift] 036 2 ** 3: PASSED (\(x1))")

        let x2 = Int(pow(10.0, 2.0))
        assert(x2 == 100, "036: 10 ** 2 failed")
        totalAssertions += 1
        print("[Swift] 036 10 ** 2: PASSED (\(x2))")

        let x3 = Int(pow(2.0, 10.0))
        assert(x3 == 1024, "036: 2 ** 10 failed")
        totalAssertions += 1
        print("[Swift] 036 2 ** 10: PASSED (\(x3))")

        // 037: 箭头函数（Swift 使用闭包）
        let add: (Int, Int) -> Int = { a, b in a + b }
        let result1 = add(1, 2)
        assert(result1 == 3, "037: add failed")
        totalAssertions += 1
        print("[Swift] 037 add: PASSED (\(result1))")

        let square: (Int) -> Int = { x in x * x }
        let result2 = square(5)
        assert(result2 == 25, "037: square failed")
        totalAssertions += 1
        print("[Swift] 037 square: PASSED (\(result2))")

        // 038: 运算符优先级
        let x4 = 2 + 3 * 4
        assert(x4 == 14, "038: 2 + 3 * 4 failed")
        totalAssertions += 1
        print("[Swift] 038 2 + 3 * 4: PASSED (\(x4))")

        let x5 = (2 + 3) * 4
        assert(x5 == 20, "038: (2 + 3) * 4 failed")
        totalAssertions += 1
        print("[Swift] 038 (2 + 3) * 4: PASSED (\(x5))")

        let x6 = true || false && false
        assert(x6 == true, "038: true || false && false failed")
        totalAssertions += 1
        print("[Swift] 038 true || false && false: PASSED (\(x6))")

        // 039: 更多复合赋值
        var x7 = 2.0
        x7 = pow(x7, 3)
        assert(Int(x7) == 8, "039: **= failed")
        totalAssertions += 1
        print("[Swift] 039 **=: PASSED (\(Int(x7)))")

        var x8 = 1
        x8 <<= 2
        assert(x8 == 4, "039: <<= failed")
        totalAssertions += 1
        print("[Swift] 039 <<=: PASSED (\(x8))")

        var x9 = 8
        x9 >>= 1
        assert(x9 == 4, "039: >>= failed")
        totalAssertions += 1
        print("[Swift] 039 >>=: PASSED (\(x9))")

        print("")
        print("=== Swift Operators New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
