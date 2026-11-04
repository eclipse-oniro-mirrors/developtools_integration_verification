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
 * @id SEM_15_14_00_203_RUNTIME_nonzero_int_true
 * @expect runtime
 * @section 15.14
 * @design 非零整数在条件中为 truthy。
 */

function main(): void {
  let x = 1 ? 'truthy' : 'falsy'
  arktest.assertEQ(x, 'truthy')
}
