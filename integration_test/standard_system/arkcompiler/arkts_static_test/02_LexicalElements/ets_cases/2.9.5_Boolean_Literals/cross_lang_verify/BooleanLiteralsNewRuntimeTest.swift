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
// Swift Runtime Test - 对应 2.9.5 Boolean Literals 补充用例
// 测试重点：布尔默认值、布尔在循环中、布尔函数参数、布尔类型守卫
// 覆盖 4 个新增 runtime 测试场景 (020-023)

import Foundation

func testBool(_ x: Bool) -> Bool {
    return x
}

func and(_ a: Bool, _ b: Bool) -> Bool {
    return a && b
}

func or(_ a: Bool, _ b: Bool) -> Bool {
    return a || b
}

func not(_ x: Bool) -> Bool {
    return !x
}

@main
struct BooleanLiteralsNewRuntimeTest {
    static func main() {
        print("=== Swift Boolean Literals New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 020: 布尔默认值
        let x1 = false
        assert(x1 == false, "020: false failed")
        totalAssertions += 1
        print("[Swift] 020 false: PASSED (\(x1))")

        let x2 = true
        assert(x2 == true, "020: true failed")
        totalAssertions += 1
        print("[Swift] 020 true: PASSED (\(x2))")

        // 021: 布尔在循环中
        var i = 0
        var sum1 = 0
        while i < 5 {
            sum1 = sum1 + i
            i += 1
        }
        assert(sum1 == 10, "021: while loop failed")
        totalAssertions += 1
        print("[Swift] 021 while loop: PASSED (\(sum1))")

        var sum2 = 0
        for j in 0..<5 {
            sum2 = sum2 + j
        }
        assert(sum2 == 10, "021: for loop failed")
        totalAssertions += 1
        print("[Swift] 021 for loop: PASSED (\(sum2))")

        // 022: 布尔函数参数
        let result1 = testBool(true)
        assert(result1 == true, "022: testBool(true) failed")
        totalAssertions += 1
        print("[Swift] 022 testBool(true): PASSED (\(result1))")

        let result2 = and(true, false)
        assert(result2 == false, "022: and(true, false) failed")
        totalAssertions += 1
        print("[Swift] 022 and(true, false): PASSED (\(result2))")

        let result3 = or(true, false)
        assert(result3 == true, "022: or(true, false) failed")
        totalAssertions += 1
        print("[Swift] 022 or(true, false): PASSED (\(result3))")

        let result4 = not(true)
        assert(result4 == false, "022: not(true) failed")
        totalAssertions += 1
        print("[Swift] 022 not(true): PASSED (\(result4))")

        // 023: 布尔类型守卫
        let x3 = true
        if x3 != true {
            fatalError("023: boolean value failed")
        }
        totalAssertions += 1
        print("[Swift] 023 boolean value: PASSED (\(x3))")

        let x4 = false
        if x4 != false {
            fatalError("023: false value failed")
        }
        totalAssertions += 1
        print("[Swift] 023 false value: PASSED (\(x4))")

        print("")
        print("=== Swift Boolean Literals New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
