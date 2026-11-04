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
 * @id SEM_15_08_00_030_PASS_guard_return_narrows_after
 * @expect compile-pass
 * @section 15.8
 * @design | 鎺у埗娴佺缉绐?| Java pattern variable 鏄祦浣滅敤鍩熴€?| Swift `if let`/`guard let` 浣滅敤鍩熸樉寮忋€?|
 *    `SEM_15_08_024_PASS_guard_return_narrows_after` | `SEM_15_08_026_FAIL_outside_branch_use` |
 * @note Generated one-to-one from test_design.
 */

function sem1508Pass021GuardReturnNarrowsAfter(): void {
  let value: int = 1
}



