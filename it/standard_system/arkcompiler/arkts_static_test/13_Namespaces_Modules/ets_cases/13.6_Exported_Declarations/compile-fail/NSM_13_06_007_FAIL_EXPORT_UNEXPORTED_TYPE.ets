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
 * @id NSM_13_06_007_FAIL_EXPORT_UNEXPORTED_TYPE
 * @expect compile-fail
 * @section 13.6
 * @design Exported function/accessor/variable uses unexported entity
 *     → compile-time error
 */

class A { constructor(a: A) {}; }

// The following declarations cause compile-time errors because 'A' is not exported
export let v: A
export function foo(p: A): A { return p; }
