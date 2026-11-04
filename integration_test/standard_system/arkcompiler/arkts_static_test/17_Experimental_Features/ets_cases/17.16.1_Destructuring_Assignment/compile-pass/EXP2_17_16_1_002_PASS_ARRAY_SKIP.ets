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
 * @id EXP2_17_16_1_002_PASS_ARRAY_SKIP
 * @expect compile-pass
 * @section 17.16.1
 * @design 数组解构跳过元素——let [a, , b] = arr 跳过中间元素
 * @note 正向用例：验证跳过元素的解构声明编译通过
 */
function testArraySkip(): void {
  let arr: int[] = [10, 20, 30]
  let [first, , third] = arr
  console.log('first=' + first + ' third=' + third)
}
