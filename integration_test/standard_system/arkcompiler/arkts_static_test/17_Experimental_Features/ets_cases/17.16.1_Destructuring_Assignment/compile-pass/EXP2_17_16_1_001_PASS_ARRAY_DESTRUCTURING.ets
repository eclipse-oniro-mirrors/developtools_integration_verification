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
 * @id EXP2_17_16_1_001_PASS_ARRAY_DESTRUCTURING
 * @expect compile-pass
 * @section 17.16.1
 * @design 基本数组解构声明——let [a, b] = arr 从数组提取值
 * @note 正向用例：验证基本数组解构声明语法编译通过
 */
function testArrayDestructuring(): void {
  let arr: int[] = [1, 2, 3]
  let [a, b] = arr
  console.log('a=' + a + ' b=' + b)
}
