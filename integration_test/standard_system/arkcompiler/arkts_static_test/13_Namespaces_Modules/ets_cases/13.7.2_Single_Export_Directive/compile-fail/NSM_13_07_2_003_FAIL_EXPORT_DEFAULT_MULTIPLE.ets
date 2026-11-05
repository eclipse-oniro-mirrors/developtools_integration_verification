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
 * @id NSM_13_07_2_003_FAIL_EXPORT_DEFAULT_MULTIPLE
 * @expect compile-fail
 * @section 13.7.2
 * @design If default is present, only one such export directive is
 *                   possible in the current module → compile-time error
 */

class A {}
export default A
class B {}
export default B // Compile-time error: multiple export default
