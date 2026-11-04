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
 * @id NSM_13_06_005_FAIL_EXPORT_NO_EXPLICIT_TYPE
 * @expect compile-fail
 * @section 13.6
 * @design Exported constants and variables without explicit types
 *     → compile-time error
 */

export let b = 1 // Compile-time error - no explicit type
export const d = 1 // Compile-time error - no explicit type
