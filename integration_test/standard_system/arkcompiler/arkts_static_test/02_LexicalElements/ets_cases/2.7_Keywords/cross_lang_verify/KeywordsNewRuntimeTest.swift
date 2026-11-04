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
// Swift Runtime Test - 对应 2.7 Keywords 补充用例
// 测试重点：of 关键字、do-while、switch-case、throw
// 覆盖 4 个新增 runtime 测试场景 (097, 099-101)

import Foundation

@main
struct KeywordsNewRuntimeTest {
    static func main() {
        print("=== Swift Keywords New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 097: of 关键字 - for-in 循环
        let arr = [1, 2, 3, 4, 5]
        var sum1 = 0
        for item in arr {
            sum1 = sum1 + item
        }
        assert(sum1 == 15, "097: for-of failed")
        totalAssertions += 1
        print("[Swift] 097 for-of: PASSED (\(sum1))")

        // 099: repeat-while 关键字（Swift 的 do-while）
        var i = 0
        var sum2 = 0
        repeat {
            sum2 = sum2 + i
            i += 1
        } while i < 5
        assert(sum2 == 10, "099: repeat-while failed")
        totalAssertions += 1
        print("[Swift] 099 repeat-while: PASSED (\(sum2))")

        // 100: switch-case 关键字
        let x = 1
        var result = 0
        switch x {
            case 1:
                result = 10
            case 2:
                result = 20
            default:
                result = 0
        }
        assert(result == 10, "100: switch-case failed")
        totalAssertions += 1
        print("[Swift] 100 switch-case: PASSED (\(result))")

        // 101: throw 关键字
        enum TestError: Error {
            case testError
        }

        var caught = false
        do {
            throw TestError.testError
        } catch {
            caught = true
        }
        assert(caught == true, "101: throw failed")
        totalAssertions += 1
        print("[Swift] 101 throw: PASSED (\(caught))")

        print("")
        print("=== Swift Keywords New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
