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
// Swift Runtime Test - 对应 2.9.2 Integer Literals 补充用例
// 测试重点：零的不同表示、负数进制、long 溢出、边界运算、类型转换
// 覆盖 5 个新增 runtime 测试场景 (026-030)

import Foundation

@main
struct IntegerLiteralsNewRuntimeTest {
    static func main() {
        print("=== Swift Integer Literals New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 026: 零的不同进制表示
        let x1 = 0
        let x2 = 0x0
        let x3 = 0o0
        let x4 = 0b0

        assert(x1 == 0, "026: 0 failed")
        totalAssertions += 1
        print("[Swift] 026 0: PASSED (\(x1))")

        assert(x2 == 0, "026: 0x0 failed")
        totalAssertions += 1
        print("[Swift] 026 0x0: PASSED (\(x2))")

        assert(x3 == 0, "026: 0o0 failed")
        totalAssertions += 1
        print("[Swift] 026 0o0: PASSED (\(x3))")

        assert(x4 == 0, "026: 0b0 failed")
        totalAssertions += 1
        print("[Swift] 026 0b0: PASSED (\(x4))")

        // 027: 负数进制表示
        let x5 = -42
        let x6 = -0xFF
        let x7 = -0o77
        let x8 = -0b1010

        assert(x5 == -42, "027: -42 failed")
        totalAssertions += 1
        print("[Swift] 027 -42: PASSED (\(x5))")

        assert(x6 == -255, "027: -0xFF failed")
        totalAssertions += 1
        print("[Swift] 027 -0xFF: PASSED (\(x6))")

        assert(x7 == -63, "027: -0o77 failed")
        totalAssertions += 1
        print("[Swift] 027 -0o77: PASSED (\(x7))")

        assert(x8 == -10, "027: -0b1010 failed")
        totalAssertions += 1
        print("[Swift] 027 -0b1010: PASSED (\(x8))")

        // 028: long 溢出行为
        let x9: Int64 = Int64.max
        assert(x9 == 9223372036854775807, "028: long max failed")
        totalAssertions += 1
        print("[Swift] 028 long max: PASSED (\(x9))")

        let x10: Int64 = Int64.min
        assert(x10 == -9223372036854775808, "028: long min failed")
        totalAssertions += 1
        print("[Swift] 028 long min: PASSED (\(x10))")

        let x11: Int64 = Int64.max &+ 1
        assert(x11 == Int64.min, "028: long overflow failed")
        totalAssertions += 1
        print("[Swift] 028 long overflow: PASSED (\(x11))")

        // 029: 边界运算
        let x12 = Int.max &+ 1
        assert(x12 == Int.min, "029: int max + 1 failed")
        totalAssertions += 1
        print("[Swift] 029 int max + 1: PASSED (\(x12))")

        let x13 = Int.min &- 1
        assert(x13 == Int.max, "029: int min - 1 failed")
        totalAssertions += 1
        print("[Swift] 029 int min - 1: PASSED (\(x13))")

        // 030: 类型转换
        let x14: Int = 42
        let x15: Int64 = Int64(x14)  // widening
        assert(x15 == 42, "030: int to long failed")
        totalAssertions += 1
        print("[Swift] 030 int to long: PASSED (\(x15))")

        let x16: Int64 = 42
        let x17: Int = Int(x16)  // narrowing
        assert(x17 == 42, "030: long to int failed")
        totalAssertions += 1
        print("[Swift] 030 long to int: PASSED (\(x17))")

        print("")
        print("=== Swift Integer Literals New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
