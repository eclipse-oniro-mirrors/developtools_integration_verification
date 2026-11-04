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
 * @id NSM_13_07_003_RUNTIME_EXPORT_DIRECTIVE
 * @expect runtime
 * @section 13.7
 * @design Export directive runtime access
 */

let counter: int = 0
export counter

function main(): int {
    console.log(counter.toString())
    return counter == 0 ? 0 : 1
}
