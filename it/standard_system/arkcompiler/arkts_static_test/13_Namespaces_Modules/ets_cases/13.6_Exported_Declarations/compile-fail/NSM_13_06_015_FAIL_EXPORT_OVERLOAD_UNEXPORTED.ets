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
 * @id NSM_13_06_015_FAIL_EXPORT_OVERLOAD_UNEXPORTED
 * @expect compile-fail
 * @section 13.6
 * @design export overload referencing unexported function
 * @note function foo is not exported, so export overload baz { foo, bar }
 *             is compile-time error
 */

function foo(): void {}
export function bar(): void {}

// Compile-time error: `foo` not exported
export overload baz { foo, bar }
