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
// Swift Runtime Test - 对应 2.9.6 String Literals 补充用例
// 测试重点：字符串插值、字符串方法、字符串条件表达式、字符串数组
// 覆盖 4 个新增 runtime 测试场景 (028-031)

import Foundation

@main
struct StringLiteralsNewRuntimeTest {
    static func main() {
        print("=== Swift String Literals New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 028: 字符串插值
        let name = "World"
        let greeting = "Hello, \(name)!"
        assert(greeting == "Hello, World!", "028: interpolation failed")
        totalAssertions += 1
        print("[Swift] 028 interpolation: PASSED (\(greeting))")

        let x = 10
        let y = 20
        let sum = "Sum: \(x + y)"
        assert(sum == "Sum: 30", "028: expression interpolation failed")
        totalAssertions += 1
        print("[Swift] 028 expression interpolation: PASSED (\(sum))")

        // 029: 字符串方法
        let s1 = "Hello"
        let s2 = String(s1.prefix(3))
        assert(s2 == "Hel", "029: prefix failed")
        totalAssertions += 1
        print("[Swift] 029 prefix: PASSED (\(s2))")

        let s3 = s1.uppercased()
        assert(s3 == "HELLO", "029: uppercased failed")
        totalAssertions += 1
        print("[Swift] 029 uppercased: PASSED (\(s3))")

        let s4 = s1.lowercased()
        assert(s4 == "hello", "029: lowercased failed")
        totalAssertions += 1
        print("[Swift] 029 lowercased: PASSED (\(s4))")

        let s5 = "  Hello  "
        let s6 = s5.trimmingCharacters(in: .whitespaces)
        assert(s6 == "Hello", "029: trim failed")
        totalAssertions += 1
        print("[Swift] 029 trim: PASSED (\(s6))")

        let s7 = s1.replacingOccurrences(of: "l", with: "L")
        assert(s7 == "HeLLo", "029: replace failed")
        totalAssertions += 1
        print("[Swift] 029 replace: PASSED (\(s7))")

        // 030: 字符串条件表达式
        let s8 = "Hello"
        var result1 = 0
        if s8.count > 0 {
            result1 = 1
        }
        assert(result1 == 1, "030: length > 0 failed")
        totalAssertions += 1
        print("[Swift] 030 length > 0: PASSED (\(result1))")

        let s9 = ""
        var result2 = 0
        if s9.count == 0 {
            result2 = 1
        }
        assert(result2 == 1, "030: empty string failed")
        totalAssertions += 1
        print("[Swift] 030 empty string: PASSED (\(result2))")

        // 031: 字符串数组
        let arr1 = ["Hello", "World", "Test"]
        assert(arr1[0] == "Hello", "031: arr1[0] failed")
        totalAssertions += 1
        print("[Swift] 031 arr1[0]: PASSED (\(arr1[0]))")

        assert(arr1.count == 3, "031: arr1.length failed")
        totalAssertions += 1
        print("[Swift] 031 arr1.length: PASSED (\(arr1.count))")

        print("")
        print("=== Swift String Literals New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
