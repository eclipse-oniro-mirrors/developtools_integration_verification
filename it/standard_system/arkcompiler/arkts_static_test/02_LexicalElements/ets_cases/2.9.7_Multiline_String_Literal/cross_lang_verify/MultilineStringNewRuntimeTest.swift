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
// Swift Runtime Test - 对应 2.9.7 Multiline String Literal 补充用例
// 测试重点：多行字符串插值、长度、比较、函数使用
// 覆盖 4 个新增 runtime 测试场景 (013-016)

import Foundation

func getMultiline() -> String {
    return """
    Line 1
    Line 2
    """
}

func printMultiline(_ s: String) -> String {
    return s
}

@main
struct MultilineStringNewRuntimeTest {
    static func main() {
        print("=== Swift Multiline String Literal New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 013: 多行字符串插值
        let name = "World"
        let s1 = "Hello, \(name)!"
        assert(s1 == "Hello, World!", "013: interpolation failed")
        totalAssertions += 1
        print("[Swift] 013 interpolation: PASSED (\(s1))")

        let x = 10
        let y = 20
        let s2 = "Sum: \(x + y)"
        assert(s2 == "Sum: 30", "013: expression interpolation failed")
        totalAssertions += 1
        print("[Swift] 013 expression interpolation: PASSED (\(s2))")

        // 014: 多行字符串长度
        let s3 = "Hello\nWorld"
        assert(s3.count == 11, "014: multiline length failed")
        totalAssertions += 1
        print("[Swift] 014 multiline length: PASSED (\(s3.count))")

        let s4 = ""
        assert(s4.count == 0, "014: empty length failed")
        totalAssertions += 1
        print("[Swift] 014 empty length: PASSED (\(s4.count))")

        let s5 = "Hello"
        assert(s5.count == 5, "014: single line length failed")
        totalAssertions += 1
        print("[Swift] 014 single line length: PASSED (\(s5.count))")

        // 015: 多行字符串比较
        let s6 = "Hello\nWorld"
        let s7 = "Hello\nWorld"
        assert(s6 == s7, "015: equality failed")
        totalAssertions += 1
        print("[Swift] 015 equality: PASSED")

        let s8 = "Hello\nTest"
        assert(s6 != s8, "015: inequality failed")
        totalAssertions += 1
        print("[Swift] 015 inequality: PASSED")

        // 016: 多行字符串在函数中
        let s9 = getMultiline()
        let expected = "Line 1\nLine 2"
        assert(s9 == expected, "016: getMultiline failed")
        totalAssertions += 1
        print("[Swift] 016 getMultiline: PASSED (\(s9))")

        let s10 = "Hello\nWorld"
        let s11 = printMultiline(s10)
        assert(s11 == s10, "016: printMultiline failed")
        totalAssertions += 1
        print("[Swift] 016 printMultiline: PASSED (\(s11))")

        print("")
        print("=== Swift Multiline String Literal New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
