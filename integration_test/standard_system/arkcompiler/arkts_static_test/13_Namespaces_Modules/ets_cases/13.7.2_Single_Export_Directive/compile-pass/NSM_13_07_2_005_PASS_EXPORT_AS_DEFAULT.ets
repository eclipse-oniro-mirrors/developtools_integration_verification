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
 * @id NSM_13_07_2_005_PASS_EXPORT_AS_DEFAULT
 * @expect compile-pass
 * @section 13.7.2
 * @design export { identifier as default } syntax
 * @note spec example: class A {}; export default A; export {A as default}
 *             — both syntax forms are acceptable
 */

class A {}

export { A as default }
