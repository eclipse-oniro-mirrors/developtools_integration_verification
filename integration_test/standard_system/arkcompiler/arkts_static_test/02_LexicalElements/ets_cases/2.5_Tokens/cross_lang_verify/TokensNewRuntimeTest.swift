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
// Swift Runtime Test - 对应 2.5 Tokens 补充用例
// 测试重点：可选链、空值合并、Unicode标识符、模板字面量、BigInt
// 覆盖 5 个新增 runtime 测试场景 (044-048)

import Foundation

struct Address {
    let city: String
}

struct Person {
    let name: String
    let address: Address?
}

@main
struct TokensNewRuntimeTest {
    static func main() {
        print("=== Swift Tokens New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 044: 可选链运算符
        let person1 = Person(name: "Alice", address: Address(city: "Beijing"))
        let person2 = Person(name: "Bob", address: nil)

        let city1 = person1.address?.city
        assert(city1 == "Beijing", "044: person1 city failed")
        totalAssertions += 1
        print("[Swift] 044 optional chaining: PASSED (\(city1 ?? "nil"))")

        let city2 = person2.address?.city
        assert(city2 == nil, "044: person2 city failed")
        totalAssertions += 1
        print("[Swift] 044 optional chaining nil: PASSED")

        // 045: 空值合并运算符
        let x: Int? = nil
        let y = x ?? 42
        assert(y == 42, "045: nil ?? 42 failed")
        totalAssertions += 1
        print("[Swift] 045 nil ?? 42: PASSED (\(y))")

        let a: Int? = 10
        let b = a ?? 42
        assert(b == 10, "045: 10 ?? 42 failed")
        totalAssertions += 1
        print("[Swift] 045 10 ?? 42: PASSED (\(b))")

        // 046: Unicode 标识符
        let 变量1 = 100
        assert(变量1 == 100, "046: 变量1 failed")
        totalAssertions += 1
        print("[Swift] 046 Unicode identifier: PASSED (\(变量1))")

        let π = 3.14
        assert(π > 3.13 && π < 3.15, "046: π failed")
        totalAssertions += 1
        print("[Swift] 046 Unicode identifier π: PASSED (\(π))")

        // 047: 模板字面量（Swift 使用字符串插值）
        let name = "World"
        let greeting = "Hello, \(name)!"
        assert(greeting == "Hello, World!", "047: template literal failed")
        totalAssertions += 1
        print("[Swift] 047 template literal: PASSED (\(greeting))")

        let xVal = 10
        let yVal = 20
        let sum = "Sum: \(xVal + yVal)"
        assert(sum == "Sum: 30", "047: template expression failed")
        totalAssertions += 1
        print("[Swift] 047 template expression: PASSED (\(sum))")

        // 048: BigInt 字面量（Swift 使用 Int64 模拟）
        let x1: Int64 = 123
        assert(x1 == 123, "048: 123n failed")
        totalAssertions += 1
        print("[Swift] 048 BigInt: PASSED (\(x1))")

        let x2: Int64 = 0
        assert(x2 == 0, "048: 0n failed")
        totalAssertions += 1
        print("[Swift] 048 BigInt 0: PASSED (\(x2))")

        let sumBigInt = x1 + (-456)
        assert(sumBigInt == -333, "048: BigInt sum failed")
        totalAssertions += 1
        print("[Swift] 048 BigInt sum: PASSED (\(sumBigInt))")

        print("")
        print("=== Swift Tokens New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
