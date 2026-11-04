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
 * @id EXP2_17_16_1_011_FAIL_DUPLICATE_BINDING
 * @expect compile-fail
 * @section 17.16.1
 * @design 解构中重复绑定同一变量——let [a, a] = arr 应触发 ESE0351
 * @note 反向用例：验证重复变量绑定产生 ESE0351: Variable 'a' has already been declared
 */
function testDuplicateBinding(): void {
  let arr: int[] = [1, 2]
  let [a, a] = arr
  console.log(a)
}
