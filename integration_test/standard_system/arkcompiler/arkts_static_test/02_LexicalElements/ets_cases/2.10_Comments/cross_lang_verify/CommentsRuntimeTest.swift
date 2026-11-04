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
// Swift Runtime Test - 对应 2.10 Comments
// 测试重点：单行注释、多行注释不影响代码执行
// 覆盖 2 个 runtime 测试场景 (011-012)

import Foundation

@main
struct CommentsRuntimeTest {
    static func main() {
        print("=== Swift Comments Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 011: 单行注释不影响代码执行
        // This is a comment
        let x1 = 1
        assert(x1 == 1, "011: line comment failed")
        totalAssertions += 1
        print("[Swift] 011 line comment: PASSED (\(x1))")

        // Another comment
        let x2 = 2
        assert(x2 == 2, "011: line comment failed")
        totalAssertions += 1
        print("[Swift] 011 line comment: PASSED (\(x2))")

        let x3 = x1 + x2 // Comment after code
        assert(x3 == 3, "011: line comment after code failed")
        totalAssertions += 1
        print("[Swift] 011 line comment after code: PASSED (\(x3))")

        // 012: 多行注释不影响代码执行
        /* This is a multiline comment */
        let x4 = 1
        assert(x4 == 1, "012: multiline comment failed")
        totalAssertions += 1
        print("[Swift] 012 multiline comment: PASSED (\(x4))")

        /*
         * This is a multiline comment
         * that spans multiple lines
         */
        let x5 = 2
        assert(x5 == 2, "012: multiline comment failed")
        totalAssertions += 1
        print("[Swift] 012 multiline comment: PASSED (\(x5))")

        let x6 = x4 + x5 /* Comment */ + 3
        assert(x6 == 6, "012: inline multiline comment failed")
        totalAssertions += 1
        print("[Swift] 012 inline multiline comment: PASSED (\(x6))")

        print("")
        print("=== Swift Comments Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
