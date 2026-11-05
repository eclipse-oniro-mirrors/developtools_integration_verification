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
 * @id NSM_13_08_005_RUNTIME_TOP_LEVEL_EXEC
 * @expect runtime
 * @section 13.8
 * @design Top-level statements executed once, declarations precede statements
 */

let x: int = 10
let y: int = 20

x = x + y

function main(): int {
    console.log(x.toString())
    return x == 30 ? 0 : 1
}
