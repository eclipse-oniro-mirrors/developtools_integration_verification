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
/**
 * @id TYP_03_21_03_005_FAIL_T_ASSIGN_PARTIAL
 * @expect compile-fail
 * @section 3.21.3
 * @design T 不可直接赋值给 Partial<T>
 * @note 反向用例：spec §3.21.3 明确 "Type T is not assignable to Partial<T>"
 */
interface I5 {
  x: int
  y: int
}

function testTAssignPartialFail(): void {
  let full: I5 = {x: 1, y: 2}
  let part: Partial<I5> = full
}