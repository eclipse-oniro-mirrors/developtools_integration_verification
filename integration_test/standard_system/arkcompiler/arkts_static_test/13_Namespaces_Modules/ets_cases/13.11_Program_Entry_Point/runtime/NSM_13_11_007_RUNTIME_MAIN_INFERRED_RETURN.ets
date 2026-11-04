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
 * @id NSM_13_11_007_RUNTIME_MAIN_INFERRED_RETURN
 * @expect runtime
 * @section 13.11
 * @design inferred return type from main() body
 * @note spec: "a return type is inferred from the body of main().
 *             It will be 'int' if the body has 'return' with the integer
 *             expression and 'void' if no return at all in the body"
 */

function main() {
    // Return type inferred as 'int' because body has return with int expr
    return 0
}
