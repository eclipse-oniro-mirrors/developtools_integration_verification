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
 * @id EXP2_17_16_1_004_PASS_LITERAL_RHS
 * @expect compile-pass
 * @section 17.16.1
 * @design 解构声明的 RHS 为数组字面量——let [a, b] = [1, 2] 直接解构字面量
 * @note 正向用例：验证 RHS 为字面量数组时解构编译通过
 */
function testLiteralRHS(): void {
  let [a, b] = [100, 200]
  console.log('a=' + a + ' b=' + b)
}
