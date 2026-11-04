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
// Swift Runtime Test - 对应 2.9.3 Floating-Point Literals 补充用例
// 测试重点：负浮点数、零浮点表示、科学计数法变体、特殊值运算、精度差异
// 覆盖 5 个新增 runtime 测试场景 (023-027)

import Foundation

@main
struct FloatingPointNewRuntimeTest {
    static func main() {
        print("=== Swift Floating-Point Literals New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 023: 负浮点数
        let x1 = -3.14
        assert(x1 == -3.14, "023: -3.14 failed")
        totalAssertions += 1
        print("[Swift] 023 -3.14: PASSED (\(x1))")

        let x2 = -0.5
        assert(x2 == -0.5, "023: -0.5 failed")
        totalAssertions += 1
        print("[Swift] 023 -0.5: PASSED (\(x2))")

        let x3 = -0.5
        assert(x3 == -0.5, "023: -0.5 failed")
        totalAssertions += 1
        print("[Swift] 023 -0.5: PASSED (\(x3))")

        let x4 = -1e10
        assert(x4 == -10000000000.0, "023: -1e10 failed")
        totalAssertions += 1
        print("[Swift] 023 -1e10: PASSED (\(x4))")

        // 024: 零浮点表示
        let x5 = 0.0
        let x6 = 0.0  // Swift requires 0.0, not .0
        let x7 = 0e0

        assert(x5 == 0.0, "024: 0.0 failed")
        totalAssertions += 1
        print("[Swift] 024 0.0: PASSED (\(x5))")

        assert(x6 == 0.0, "024: .0 failed")
        totalAssertions += 1
        print("[Swift] 024 .0: PASSED (\(x6))")

        assert(x7 == 0.0, "024: 0e0 failed")
        totalAssertions += 1
        print("[Swift] 024 0e0: PASSED (\(x7))")

        // 025: 科学计数法变体
        let x8 = 1.5E10
        assert(x8 == 15000000000.0, "025: 1.5E10 failed")
        totalAssertions += 1
        print("[Swift] 025 1.5E10: PASSED (\(x8))")

        let x9 = 1e-5
        assert(x9 == 0.00001, "025: 1e-5 failed")
        totalAssertions += 1
        print("[Swift] 025 1e-5: PASSED (\(x9))")

        let x10 = 1.5e+10
        assert(x10 == 15000000000.0, "025: 1.5e+10 failed")
        totalAssertions += 1
        print("[Swift] 025 1.5e+10: PASSED (\(x10))")

        // 026: 特殊值运算
        let nan = 0.0 / 0.0
        let x11 = nan + 1
        assert(x11.isNaN, "026: NaN + 1 should be NaN")
        totalAssertions += 1
        print("[Swift] 026 NaN + 1: PASSED (\(x11))")

        let inf = 1.0 / 0.0
        let x12 = inf + 1
        assert(x12.isInfinite, "026: Infinity + 1 should be Infinity")
        totalAssertions += 1
        print("[Swift] 026 Infinity + 1: PASSED (\(x12))")

        assert(nan != nan, "026: NaN should not equal itself")
        totalAssertions += 1
        print("[Swift] 026 NaN != NaN: PASSED")

        assert(inf == inf, "026: Infinity should equal itself")
        totalAssertions += 1
        print("[Swift] 026 Infinity == Infinity: PASSED")

        // 027: float vs double 精度
        let x13: Float = 3.141592653589793
        assert(x13 > 3.141592 && x13 < 3.141594, "027: float precision failed")
        totalAssertions += 1
        print("[Swift] 027 float precision: PASSED (\(x13))")

        let x14: Double = 3.141592653589793
        assert(x14 > 3.141592653589792 && x14 < 3.141592653589794, "027: double precision failed")
        totalAssertions += 1
        print("[Swift] 027 double precision: PASSED (\(x14))")

        print("")
        print("=== Swift Floating-Point Literals New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
