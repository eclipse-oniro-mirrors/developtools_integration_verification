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
 * @id TYP_03_11_014_FAIL_VOID_ARRAY_NON_UNDEFINED
 * @expect compile-fail
 * @section 3.11
 * @design void[] 只能包含 undefined
 * @note 反向用例：void[] 放入非 undefined 值
 */
function testVoidArrayNonUndefinedFail(): void {
  let a1: void[] = [1]
  let a2: Array<void> = ["hello"]
  let a3: void[] = [true]
}