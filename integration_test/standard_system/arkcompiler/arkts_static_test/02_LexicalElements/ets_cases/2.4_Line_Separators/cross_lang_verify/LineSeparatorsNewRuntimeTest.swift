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
// Swift Runtime Test - 对应 2.4 Line Separators 补充用例
// 测试重点：对象字面量、条件表达式、循环、switch、try-catch 中的换行符
// 覆盖 5 个新增 runtime 测试场景 (037-041)

import Foundation

struct Point {
    let x: Int
    let y: Int
    let z: Int
}

struct Nested {
    let a: Point
    let b: Point
}

@main
struct LineSeparatorsNewRuntimeTest {
    static func main() {
        print("=== Swift Line Separators New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 037: 对象字面量内换行
        let obj1 = Point(
            x: 1,
            y: 2,
            z: 3
        )
        assert(obj1.x == 1, "037: obj1.x failed")
        totalAssertions += 1
        print("[Swift] 037 obj1.x: PASSED (\(obj1.x))")

        assert(obj1.y == 2, "037: obj1.y failed")
        totalAssertions += 1
        print("[Swift] 037 obj1.y: PASSED (\(obj1.y))")

        assert(obj1.z == 3, "037: obj1.z failed")
        totalAssertions += 1
        print("[Swift] 037 obj1.z: PASSED (\(obj1.z))")

        // 038: 条件表达式内换行
        let x = 10
        var result1 = 0
        if x > 5 {
            result1 = x + 1
        }
        assert(result1 == 11, "038: if failed")
        totalAssertions += 1
        print("[Swift] 038 if: PASSED (\(result1))")

        var result2 = 0
        if x > 5 {
            result2 = x + 1
        } else {
            result2 = x - 1
        }
        assert(result2 == 11, "038: if-else failed")
        totalAssertions += 1
        print("[Swift] 038 if-else: PASSED (\(result2))")

        let z = (x > 5)
            ? x + 1
            : x - 1
        assert(z == 11, "038: ternary failed")
        totalAssertions += 1
        print("[Swift] 038 ternary: PASSED (\(z))")

        // 039: 循环语句内换行
        var sum1 = 0
        for i in 0..<5 {
            sum1 = sum1 + i
        }
        assert(sum1 == 10, "039: for loop failed")
        totalAssertions += 1
        print("[Swift] 039 for loop: PASSED (\(sum1))")

        var sum2 = 0
        var i = 0
        while i < 5 {
            sum2 = sum2 + i
            i += 1
        }
        assert(sum2 == 10, "039: while loop failed")
        totalAssertions += 1
        print("[Swift] 039 while loop: PASSED (\(sum2))")

        // 040: switch 语句内换行
        let switchX = 1
        var switchResult = 0
        switch switchX {
            case 1:
                switchResult = 10
            case 2:
                switchResult = 20
            default:
                switchResult = 0
        }
        assert(switchResult == 10, "040: switch failed")
        totalAssertions += 1
        print("[Swift] 040 switch: PASSED (\(switchResult))")

        // 041: try-catch 内换行
        var tryResult = 0
        do {
            let tryX = 1
            let tryY = 2
            tryResult = tryX + tryY
        } catch {
            tryResult = -1
        }
        assert(tryResult == 3, "041: try-catch failed")
        totalAssertions += 1
        print("[Swift] 041 try-catch: PASSED (\(tryResult))")

        print("")
        print("=== Swift Line Separators New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
