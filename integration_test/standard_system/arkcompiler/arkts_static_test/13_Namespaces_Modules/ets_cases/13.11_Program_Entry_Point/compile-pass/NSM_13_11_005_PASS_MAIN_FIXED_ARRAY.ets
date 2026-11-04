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
 * @id NSM_13_11_005_PASS_MAIN_FIXED_ARRAY
 * @expect compile-pass
 * @section 13.11
 * @design main with Fixedstring[] parameter is valid
 * @note spec: "Entry point function must either have no parameters,
 *             or have one parameter of type Fixedstring[]"
 */

function main(args: Fixedstring[]): int {
    return 0
}
