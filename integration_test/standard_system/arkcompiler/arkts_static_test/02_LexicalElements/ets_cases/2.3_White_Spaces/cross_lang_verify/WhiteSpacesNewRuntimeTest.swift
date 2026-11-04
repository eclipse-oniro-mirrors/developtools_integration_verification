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
// Swift Runtime Test - 对应 2.3 White Spaces 补充用例
// 测试重点：Unicode 空白字符、类型注解周围空白、泛型中空白
// 覆盖 3 个新增 runtime 测试场景 (043-045)

import Foundation

@main
struct WhiteSpacesNewRuntimeTest {
    static func main() {
        print("=== Swift White Spaces New Runtime Test ===")
        print("")

        var totalAssertions = 0

        // 043: Unicode 空白字符
        let x1: Int = 1
        let y1: Int = 2
        let z1 = x1 + y1
        assert(z1 == 3, "043: Unicode whitespace failed")
        totalAssertions += 1
        print("[Swift] 043 Unicode whitespace: PASSED (\(z1))")

        // 044: 类型注解周围空白
        let x2: Int = 10
        let y2 : Int = 20
        let z2 = x2 + y2
        assert(z2 == 30, "044: type annotation whitespace failed")
        totalAssertions += 1
        print("[Swift] 044 type annotation whitespace: PASSED (\(z2))")

        // 045: 泛型中空白
        let arr1: Array<Int> = [1, 2, 3]
        let arr2: Array < Int > = [4, 5, 6]
        let arr3: Array< Int > = [7, 8, 9]

        assert(arr1[0] == 1, "045: arr1[0] failed")
        totalAssertions += 1
        print("[Swift] 045 arr1[0]: PASSED (\(arr1[0]))")

        assert(arr2[0] == 4, "045: arr2[0] failed")
        totalAssertions += 1
        print("[Swift] 045 arr2[0]: PASSED (\(arr2[0]))")

        assert(arr3[0] == 7, "045: arr3[0] failed")
        totalAssertions += 1
        print("[Swift] 045 arr3[0]: PASSED (\(arr3[0]))")

        assert(arr1.count == 3, "045: arr1.length failed")
        totalAssertions += 1
        print("[Swift] 045 arr1.length: PASSED (\(arr1.count))")

        print("")
        print("=== Swift White Spaces New Runtime Test PASSED ===")
        print("Total assertions passed: \(totalAssertions)")
    }
}
