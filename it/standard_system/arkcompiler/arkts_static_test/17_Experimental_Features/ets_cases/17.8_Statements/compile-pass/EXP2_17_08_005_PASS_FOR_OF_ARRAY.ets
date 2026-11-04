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
 * @id EXP2_17_08_005_PASS_FOR_OF_ARRAY
 * @expect compile-pass
 * @section 17.8
 * @design 验证 for-of 遍历数组在 ArkTS 中编译通过
 * @note 正向用例：验证 for-of 遍历数组的标准用法编译通过，衔接 17.6 Iterable Types
 */
function testForOfArray(): void {
  let numbers: number[] = [1, 2, 3, 4, 5]
  let sum: number = 0
  for (let num of numbers) {
    sum = sum + num
  }

  // for-of with string array
  let words: string[] = ['hello', 'world', 'arkts']
  let concat: string = ''
  for (let w of words) {
    concat = concat + w
  }

  // for-of with break
  let count: number = 0
  for (let val of numbers) {
    count = count + 1
    if (count >= 3) {
      break
    }
  }
}
