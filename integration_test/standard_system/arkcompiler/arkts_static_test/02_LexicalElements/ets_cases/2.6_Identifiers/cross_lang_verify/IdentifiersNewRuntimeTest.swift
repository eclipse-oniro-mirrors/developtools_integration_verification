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
// Swift Runtime Test - 对应 2.6 Identifiers 补充用例
// 测试重点：长标识符、大小写敏感、作用域
// 覆盖 3 个新增 runtime 测试场景 (048-050)

import Foundation

var globalVar = 100

func testScope() -> Int {
    let localVar = 200
    if true {
        let blockVar = 300
        return globalVar + localVar + blockVar
    }
    return 0
}

@main
struct IdentifiersNewRuntimeTest {
    static func main() {
        print("=== Swift Identifiers New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 048: 长标识符
        let veryLongIdentifierNameThatIsUsedForTestingPurposesOnly = 1
        assert(veryLongIdentifierNameThatIsUsedForTestingPurposesOnly == 1, "048: long identifier failed")
        totalAssertions += 1
        print("[Swift] 048 long identifier: PASSED (\(veryLongIdentifierNameThatIsUsedForTestingPurposesOnly))")

        let a123456789012345678901234567890 = 2
        assert(a123456789012345678901234567890 == 2, "048: numeric suffix identifier failed")
        totalAssertions += 1
        print("[Swift] 048 numeric suffix identifier: PASSED (\(a123456789012345678901234567890))")

        // 049: 大小写敏感
        let myVar = 1
        let MyVar = 2
        let MYVAR = 3
        let myvar = 4

        assert(myVar == 1, "049: myVar failed")
        totalAssertions += 1
        print("[Swift] 049 myVar: PASSED (\(myVar))")

        assert(MyVar == 2, "049: MyVar failed")
        totalAssertions += 1
        print("[Swift] 049 MyVar: PASSED (\(MyVar))")

        assert(MYVAR == 3, "049: MYVAR failed")
        totalAssertions += 1
        print("[Swift] 049 MYVAR: PASSED (\(MYVAR))")

        assert(myvar == 4, "049: myvar failed")
        totalAssertions += 1
        print("[Swift] 049 myvar: PASSED (\(myvar))")

        let sum = myVar + MyVar + MYVAR + myvar
        assert(sum == 10, "049: sum failed")
        totalAssertions += 1
        print("[Swift] 049 sum: PASSED (\(sum))")

        // 050: 作用域
        assert(globalVar == 100, "050: globalVar failed")
        totalAssertions += 1
        print("[Swift] 050 globalVar: PASSED (\(globalVar))")

        let result = testScope()
        assert(result == 600, "050: testScope failed")
        totalAssertions += 1
        print("[Swift] 050 testScope: PASSED (\(result))")

        print("")
        print("=== Swift Identifiers New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
