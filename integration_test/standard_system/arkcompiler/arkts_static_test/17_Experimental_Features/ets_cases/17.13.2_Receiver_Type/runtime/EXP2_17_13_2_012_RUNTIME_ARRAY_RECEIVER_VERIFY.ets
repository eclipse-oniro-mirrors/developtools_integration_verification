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
 * @id EXP2_17_13_2_012_RUNTIME_ARRAY_RECEIVER_VERIFY
 * @expect runtime
 * @section 17.13.2
 * @design 运行时验证：数组接收者函数正确执行数组操作
 * @note 运行时用例：实际执行验证数组作为接收者类型
 */
function computeSum(this: number[]): number {
  let total: number = 0
  for (let elem of this) { total = total + elem }
  return total
}
function main(): void {
  let numbers: number[] = [10, 20, 30, 40]
  let s: number = numbers.computeSum()
  if (s != 100) { throw new Error('assertion failed: expected 100, got ' + s) }
  let s2: number = computeSum(numbers)
  if (s2 != 100) { throw new Error('assertion failed: expected 100, got ' + s2) }
  console.log('verified')
}
