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
 * @id NSM_13_02_003_FAIL_MODULE_NO_DECLARE
 * @expect compile-fail
 * @section 13.2
 * @design If a module header has the declare modifier, then the whole
 *          module is ambient. Otherwise a compile-time error occurs
 *          (when non-ambient content exists with declare module header).
 */

declare module 'MixedModule'

function realFoo(): void {}
// Compile-time error: declare module but non-ambient declarations
