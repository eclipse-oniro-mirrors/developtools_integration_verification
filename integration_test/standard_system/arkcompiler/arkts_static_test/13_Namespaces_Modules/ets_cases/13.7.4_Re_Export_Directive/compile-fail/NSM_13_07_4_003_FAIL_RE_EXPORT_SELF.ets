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
 * @id NSM_13_07_4_003_FAIL_RE_EXPORT_SELF
 * @expect compile-fail
 * @section 13.7.4
 * @design An importPath cannot refer to the file the current module is
 *                   stored in → compile-time error
 */

export * from './NSM_13_07_4_003_FAIL_RE_EXPORT_SELF.ets'
// Compile-time error: re-export refers to current file
