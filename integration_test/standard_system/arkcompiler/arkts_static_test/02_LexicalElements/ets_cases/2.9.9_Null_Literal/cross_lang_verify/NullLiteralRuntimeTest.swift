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
// Swift Runtime Test - 对应 2.9.9 Null Literal
// 测试重点：null 值、比较、类型检查
// 覆盖 3 个 runtime 测试场景 (006-008)

import Foundation

@main
struct NullLiteralRuntimeTest {
    static func main() {
        print("=== Swift Null Literal Runtime Test ===")
        print("[Swift] NOTE: Swift uses 'nil' instead of 'null'")
        print("")

        var totalAssertions = 0

        // 006: null 值验证
        let x1: Int? = nil
        assert(x1 == nil, "006: nil failed")
        totalAssertions += 1
        print("[Swift] 006 nil value: PASSED (\(String(describing: x1)))")

        // T | null 类型
        let x2: String? = nil
        assert(x2 == nil, "006: String nil failed")
        totalAssertions += 1
        print("[Swift] 006 String nil: PASSED (\(String(describing: x2)))")

        // 007: null 比较验证
        let x3: Int? = nil
        let x4: Int? = nil
        assert(x3 == x4, "007: nil equality failed")
        totalAssertions += 1
        print("[Swift] 007 nil equality: PASSED")

        // nil 与数字比较
        let x5 = 0
        assert(x3 != x5, "007: nil should not equal 0")
        totalAssertions += 1
        print("[Swift] 007 nil != 0: PASSED")

        // nil 与字符串比较
        let x6: String? = nil
        assert(x6 == nil, "007: string nil == nil failed")
        totalAssertions += 1
        print("[Swift] 007 string nil == nil: PASSED")

        // 008: null 类型检查
        let x7: Int? = nil
        assert(x7 == nil, "008: nil check failed")
        totalAssertions += 1
        print("[Swift] 008 nil check: PASSED")

        print("")
        print("=== Swift Null Literal Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
