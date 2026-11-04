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
 * @id SEM_15_11_00_116_FAIL_return_type_ignored
 * @expect compile-fail
 * @section 15.11
 * @design Return types are not considered by overload resolution, selected entity can lead to compile-time error
 * @note Spec lines 34-39: let x: number = foo("1") returns string
 */

function foo(n: number): number { return n }
function foo(s: string): string { return s }

function sem1511Fail200ReturnTypeIgnored(): void {
  let x: number = foo('1')
}
