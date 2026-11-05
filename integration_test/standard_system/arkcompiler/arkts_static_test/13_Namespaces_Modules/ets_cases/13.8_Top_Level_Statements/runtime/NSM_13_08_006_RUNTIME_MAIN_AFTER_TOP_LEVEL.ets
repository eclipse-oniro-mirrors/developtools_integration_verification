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
 * @id NSM_13_08_006_RUNTIME_MAIN_AFTER_TOP_LEVEL
 * @expect runtime
 * @section 13.8
 * @design main() executed after top-level statements
 * @note verifies execution order: top-level statements first, then main()
 */

let order: string = ''

order += 'T' // top-level statement runs first

function main(): int {
    order += 'M' // main runs after top-level statements
    // Expected: 'TM' (top-level first, main second)
    return order == 'TM' ? 0 : 1
}
