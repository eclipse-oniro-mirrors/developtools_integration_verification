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
// Swift Runtime Test - 对应 2.11 Semicolons
// 测试重点：行分隔符终止、分号分隔运行时行为
// 覆盖 2 个 runtime 测试场景 (010-011)

import Foundation

@main
struct SemicolonsRuntimeTest {
    static func main() {
        print("=== Swift Semicolons Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 010: 行分隔符终止运行时行为
        let x1 = 1
        let x2 = 2
        let x3 = x1 + x2
        assert(x3 == 3, "010: line terminator failed")
        totalAssertions += 1
        print("[Swift] 010 line terminator: PASSED (\(x3))")

        // 011: 分号分隔运行时行为
        let x4 = 1; let x5 = 2; let x6 = x4 + x5
        assert(x6 == 3, "011: semicolon failed")
        totalAssertions += 1
        print("[Swift] 011 semicolon: PASSED (\(x6))")

        print("")
        print("=== Swift Semicolons Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
