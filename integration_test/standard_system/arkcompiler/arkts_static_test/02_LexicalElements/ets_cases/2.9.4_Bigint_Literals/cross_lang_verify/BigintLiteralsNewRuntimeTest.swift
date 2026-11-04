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
// Swift Runtime Test - 对应 2.9.4 Bigint Literals 补充用例
// 测试重点：零 bigint、除法/取模、边界值、long 转换、字符串转换
// Swift 使用 Int64 模拟 bigint
// 覆盖 5 个新增 runtime 测试场景 (020-024)

import Foundation

@main
struct BigintLiteralsNewRuntimeTest {
    static func main() {
        print("=== Swift Bigint Literals New Runtime Test ===")
        print("[Swift] NOTE: Swift uses Int64 to simulate bigint")
        print("")

        var totalAssertions = 0

        // 020: 零 bigint
        let x1: Int64 = 0
        assert(x1 == 0, "020: 0n failed")
        totalAssertions += 1
        print("[Swift] 020 0n: PASSED (\(x1))")

        let x2: Int64 = -0
        assert(x2 == 0, "020: -0n failed")
        totalAssertions += 1
        print("[Swift] 020 -0n: PASSED (\(x2))")

        let x3: Int64 = 0 + 123
        assert(x3 == 123, "020: 0n + 123n failed")
        totalAssertions += 1
        print("[Swift] 020 0n + 123n: PASSED (\(x3))")

        // 021: 除法/取模
        let x4: Int64 = 10 / 3
        assert(x4 == 3, "021: 10n / 3n failed")
        totalAssertions += 1
        print("[Swift] 021 10n / 3n: PASSED (\(x4))")

        let x5: Int64 = 10 % 3
        assert(x5 == 1, "021: 10n % 3n failed")
        totalAssertions += 1
        print("[Swift] 021 10n % 3n: PASSED (\(x5))")

        let x6: Int64 = 100 / 10
        assert(x6 == 10, "021: 100n / 10n failed")
        totalAssertions += 1
        print("[Swift] 021 100n / 10n: PASSED (\(x6))")

        // 022: 边界值
        let x7: Int64 = 9223372036854775807  // Int64.max
        assert(x7 == 9223372036854775807, "022: bigint max failed")
        totalAssertions += 1
        print("[Swift] 022 bigint max: PASSED (\(x7))")

        // 023: long 转换
        let x8: Int = 42
        let x9: Int64 = Int64(x8)
        assert(x9 == 42, "023: long to bigint failed")
        totalAssertions += 1
        print("[Swift] 023 long to bigint: PASSED (\(x9))")

        // 024: 字符串转换
        let x10: Int64 = 123
        let s1 = String(x10)
        assert(s1 == "123", "024: 123n.toString() failed")
        totalAssertions += 1
        print("[Swift] 024 123n.toString(): PASSED (\(s1))")

        let x11: Int64 = -456
        let s2 = String(x11)
        assert(s2 == "-456", "024: -456n.toString() failed")
        totalAssertions += 1
        print("[Swift] 024 -456n.toString(): PASSED (\(s2))")

        let x12: Int64 = Int64("789") ?? 0
        assert(x12 == 789, "024: BigInt(\"789\") failed")
        totalAssertions += 1
        print("[Swift] 024 BigInt(\"789\"): PASSED (\(x12))")

        print("")
        print("=== Swift Bigint Literals New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
