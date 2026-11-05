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
/*
 * @id NSM_13_05_004_RUNTIME_TOP_DECL_ORDER
 * @expect runtime
 * @section 13.5
 * @design Top-level declarations execution order
 */

let x: int = 10

function add(a: int, b: int): int {
    return a + b
}

function main(): int {
    let result: int = add(x, 5)
    console.log(result.toString())
    return result == 15 ? 0 : 1
}
