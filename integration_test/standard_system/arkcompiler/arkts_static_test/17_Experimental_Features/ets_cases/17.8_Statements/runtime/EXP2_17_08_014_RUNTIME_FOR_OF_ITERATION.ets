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
 * @id EXP2_17_08_014_RUNTIME_FOR_OF_ITERATION
 * @expect runtime
 * @section 17.8
 * @design 验证 for-of 遍历数组和字符串的运行时行为
 * @note 运行时用例：实际执行验证 for-of 对数组和字符串的迭代顺序和值正确
 */
function main(): void {
  // Test for-of with number array
  let numbers: number[] = [10, 20, 30, 40, 50]
  let sumArr: number = 0
  for (let num of numbers) {
    sumArr = sumArr + num
  }
  if (sumArr != 150) {
    throw new Error("for-of array sum assertion failed: expected 150, got " + sumArr)
  }

  // Test for-of iteration order
  let orderCheck: string = ''
  for (let n of numbers) {
    orderCheck = orderCheck + n + ','
  }
  if (orderCheck != "10,20,30,40,50,") {
    throw new Error("for-of order assertion failed: expected '10,20,30,40,50,', got '" + orderCheck + ''')
  }

  // Test for-of with string
  let text: string = 'ABC'
  let charResult: string = ''
  for (let ch of text) {
    charResult = charResult + ch
  }
  if (charResult != 'ABC') {
    throw new Error("for-of string assertion failed: expected 'ABC', got '" + charResult + ''')
  }

  // Test for-of with break
  let breakSum: number = 0
  for (let val of numbers) {
    if (val >= 30) {
      break
    }
    breakSum = breakSum + val
  }
  // Only adds 10 + 20 = 30
  if (breakSum != 30) {
    throw new Error("for-of break assertion failed: expected 30, got " + breakSum)
  }

  console.log('verified')
}
