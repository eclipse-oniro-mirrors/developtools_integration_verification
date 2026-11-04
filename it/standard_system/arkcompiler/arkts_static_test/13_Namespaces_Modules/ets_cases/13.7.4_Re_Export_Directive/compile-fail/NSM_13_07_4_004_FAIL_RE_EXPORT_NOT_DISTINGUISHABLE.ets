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
 * @id NSM_13_07_4_004_FAIL_RE_EXPORT_NOT_DISTINGUISHABLE
 * @expect compile-fail
 * @section 13.7.4
 * @design If re-exported declarations are not distinguishable within
 *                   the scope of the current module → compile-time error
 *                   (same name exported from two different modules)
 */

export class A {}

// Another hypothetical file also exports class A
export * from './file1_with_A'
export * from './file2_with_A'
// Compile-time error: entity named 'A' is already exported
