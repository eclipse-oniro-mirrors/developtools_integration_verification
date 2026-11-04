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
 * @id EXP2_17_08_013_RUNTIME_LOOP_EXECUTION
 * @expect runtime
 * @section 17.8
 * @design 验证 for/while/do-while 循环的运行时执行行为
 * @note 运行时用例：实际执行验证循环迭代次数、break/continue 行为正确
 */
function main(): void {
  // Test for loop: sum 0 to 9 should be 45
  let sumFor: number = 0
  for (let i: number = 0; i < 10; i++) {
    sumFor = sumFor + i
  }
  if (sumFor != 45) {
    throw new Error('for loop sum assertion failed: expected 45, got ' + sumFor)
  }

  // Test while loop: count to 5
  let countWhile: number = 0
  while (countWhile < 5) {
    countWhile = countWhile + 1
  }
  if (countWhile != 5) {
    throw new Error('while loop assertion failed: expected 5, got ' + countWhile)
  }

  // Test do-while: executes at least once
  let doCount: number = 0
  let condition: boolean = false
  do {
    doCount = doCount + 1
  } while (condition)
  if (doCount != 1) {
    throw new Error('do-while assertion failed: expected 1, got ' + doCount)
  }

  // Test break in while
  let breakCount: number = 0
  while (true) {
    breakCount = breakCount + 1
    if (breakCount >= 3) {
      break
    }
  }
  if (breakCount != 3) {
    throw new Error('break assertion failed: expected 3, got ' + breakCount)
  }

  // Test continue in for: sum of odd numbers 0-9
  let oddSum: number = 0
  for (let j: number = 0; j < 10; j++) {
    if (j % 2 == 0) {
      continue
    }
    oddSum = oddSum + j
  }
  // 1+3+5+7+9 = 25
  if (oddSum != 25) {
    throw new Error('continue assertion failed: expected 25, got ' + oddSum)
  }

  console.log('verified')
}
