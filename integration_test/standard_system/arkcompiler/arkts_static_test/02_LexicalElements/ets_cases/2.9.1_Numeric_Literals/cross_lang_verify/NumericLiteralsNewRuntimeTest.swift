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
// Swift Runtime Test - 对应 2.9.1 Numeric Literals 补充用例
// 测试重点：负数字面量、零的不同表示、科学计数法变体、long 最大值
// 覆盖 4 个新增 runtime 测试场景 (043-046)

import Foundation

@main
struct NumericLiteralsNewRuntimeTest {
    static func main() {
        print("=== Swift Numeric Literals New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 043: 负数字面量
        let x1 = -42
        assert(x1 == -42, "043: -42 failed")
        totalAssertions += 1
        print("[Swift] 043 -42: PASSED (\(x1))")

        let x2 = -0xFF
        assert(x2 == -255, "043: -0xFF failed")
        totalAssertions += 1
        print("[Swift] 043 -0xFF: PASSED (\(x2))")

        let x3 = -3.14
        assert(x3 == -3.14, "043: -3.14 failed")
        totalAssertions += 1
        print("[Swift] 043 -3.14: PASSED (\(x3))")

        let x4: Int64 = -123
        assert(x4 == -123, "043: -123n failed")
        totalAssertions += 1
        print("[Swift] 043 -123n: PASSED (\(x4))")

        // 044: 零的不同表示
        let x5 = 0
        let x6 = 0x0
        let x7 = 0o0
        let x8 = 0b0
        let x9 = 0.0

        assert(x5 == 0, "044: 0 failed")
        totalAssertions += 1
        print("[Swift] 044 0: PASSED (\(x5))")

        assert(x6 == 0, "044: 0x0 failed")
        totalAssertions += 1
        print("[Swift] 044 0x0: PASSED (\(x6))")

        assert(x7 == 0, "044: 0o0 failed")
        totalAssertions += 1
        print("[Swift] 044 0o0: PASSED (\(x7))")

        assert(x8 == 0, "044: 0b0 failed")
        totalAssertions += 1
        print("[Swift] 044 0b0: PASSED (\(x8))")

        assert(x9 == 0.0, "044: 0.0 failed")
        totalAssertions += 1
        print("[Swift] 044 0.0: PASSED (\(x9))")

        // 045: 科学计数法变体
        let x10 = 1.5E10
        assert(x10 == 15000000000.0, "045: 1.5E10 failed")
        totalAssertions += 1
        print("[Swift] 045 1.5E10: PASSED (\(x10))")

        let x11 = 1e-5
        assert(x11 == 0.00001, "045: 1e-5 failed")
        totalAssertions += 1
        print("[Swift] 045 1e-5: PASSED (\(x11))")

        let x12 = 1.5e+10
        assert(x12 == 15000000000.0, "045: 1.5e+10 failed")
        totalAssertions += 1
        print("[Swift] 045 1.5e+10: PASSED (\(x12))")

        // 046: long 最大值
        let x13: Int64 = 9223372036854775807
        assert(x13 == 9223372036854775807, "046: long max failed")
        totalAssertions += 1
        print("[Swift] 046 long max: PASSED (\(x13))")

        let x14: Int64 = -9223372036854775808
        assert(x14 == -9223372036854775808, "046: long min failed")
        totalAssertions += 1
        print("[Swift] 046 long min: PASSED (\(x14))")

        print("")
        print("=== Swift Numeric Literals New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
