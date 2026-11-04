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
 * @id EXP2_17_16_1_010_FAIL_NON_ARRAY_RHS
 * @expect compile-fail
 * @section 17.16.1
 * @design 解构非数组/元组 RHS——let [a, b] = 42 应触发编译错误 ESY0049
 * @note 反向用例：验证非数组 RHS 解构产生 ESY0049: Invalid destructuring assignment target
 */
function testNonArrayRHS(): void {
  let [a, b] = 42
  console.log(a)
}
