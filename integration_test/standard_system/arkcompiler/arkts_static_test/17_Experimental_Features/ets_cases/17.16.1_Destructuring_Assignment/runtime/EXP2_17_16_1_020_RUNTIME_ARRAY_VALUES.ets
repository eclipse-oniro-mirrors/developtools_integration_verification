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
 * @id EXP2_17_16_1_020_RUNTIME_ARRAY_VALUES
 * @expect runtime
 * @section 17.16.1
 * @design 运行时验证数组解构提取的值正确
 * @note 运行时用例：实际执行验证 [a, b] = [10, 20] 提取 a=10, b=20
 */
function main(): void {
  let arr: int[] = [10, 20, 30]
  let [a, b] = arr
  if (a != 10) {
    throw new Error('FAIL: a should be 10, got: ' + a)
  }
  if (b != 20) {
    throw new Error('FAIL: b should be 20, got: ' + b)
  }
  console.log('PASS: array destructuring values correct: a=' + a + ' b=' + b)
}
