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
 * @id EXP2_17_04_01_023_RUNTIME_DIM_EVALUATED_ONCE_SIDE_EFFECT
 * @expect runtime
 * @section 17.4.1
 * @design 维度表达式仅求值一次：验证维度表达式（含副作用）在数组创建中被求值恰好一次
 * @note 运行时用例：使用全局计数器验证维度表达式的求值次数
 */
let dimCallCount: int = 0

function getDim(): int {
  dimCallCount = dimCallCount + 1
  return 5
}

function main(): void {
  let arr: int[] = new int[getDim()] (0)
  // Verify dimension expression was evaluated exactly once
  if (dimCallCount != 1) {
    throw new Error('assertion failed: dim expression should be evaluated exactly once, got ' + dimCallCount + ' times')
  }
  // Verify array was created correctly
  if (arr.length != 5) {
    throw new Error('assertion failed: array length should be 5, got ' + arr.length)
  }
  console.log('verified')
}
