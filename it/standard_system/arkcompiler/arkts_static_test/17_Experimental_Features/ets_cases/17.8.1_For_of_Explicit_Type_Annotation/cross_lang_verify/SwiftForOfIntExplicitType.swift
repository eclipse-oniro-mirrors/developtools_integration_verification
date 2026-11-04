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
/**
 * Swift equivalent of ArkTS for-of with explicit type annotation (§17.8.1)
 * Case: int explicit type on [Int] -- compile and run (PASS)
 *
 * Swift for-in requires explicit type (var/let with optional type annotation).
 * Swift's type inference also works: `for v in arr` infers Int.
 */
let arr: [Int] = [10, 20, 30, 40, 50]
let expected: [Int] = [10, 20, 30, 40, 50]
var idx: Int = 0
for v: Int in arr {
    if v != expected[idx] {
        fatalError("assertion failed: expected \(expected[idx]) but got \(v)")
    }
    idx += 1
}
if idx != 5 {
    fatalError("assertion failed: expected 5 iterations but got \(idx)")
}
print("verified")
