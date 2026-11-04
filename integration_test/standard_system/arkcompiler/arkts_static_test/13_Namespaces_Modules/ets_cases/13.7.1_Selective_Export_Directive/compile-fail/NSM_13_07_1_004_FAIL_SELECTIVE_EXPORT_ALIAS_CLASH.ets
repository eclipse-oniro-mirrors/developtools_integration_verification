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
 * @id NSM_13_07_1_004_FAIL_SELECTIVE_EXPORT_ALIAS_CLASH
 * @expect compile-fail
 * @section 13.7.1
 * @design selective export alias clashes with existing exported name
 * @note export function foo() already defines 'foo' as exported name,
 *             then export {bar as foo} causes name clash → compile-time error
 */

export function foo(): void {}
function bar(): void {}

// Compile-time error: entity named 'foo' is already exported
export { bar as foo }
