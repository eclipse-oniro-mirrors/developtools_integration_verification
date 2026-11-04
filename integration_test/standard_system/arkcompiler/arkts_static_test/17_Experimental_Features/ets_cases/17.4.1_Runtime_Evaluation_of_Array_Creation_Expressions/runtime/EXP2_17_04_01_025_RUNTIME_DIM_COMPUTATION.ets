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
 * @id EXP2_17_04_01_025_RUNTIME_DIM_COMPUTATION
 * @expect runtime
 * @section 17.4.1
 * @design 维度表达式带计算：验证 new int[2+3] (1) 维度计算结果为 5，数组长度正确
 * @note 运行时用例：验证维度表达式支持编译时运算
 */
function main(): void {
  let arr: int[] = new int[2+3] (1)
  // Verify array length equals computed dimension = 5
  if (arr.length != 5) {
    throw new Error('assertion failed: array length should be 5, got ' + arr.length)
  }
  // Verify all elements are initialized to 1
  if (arr[0] != 1) {
    throw new Error('assertion failed: arr[0] should be 1, got ' + arr[0])
  }
  if (arr[4] != 1) {
    throw new Error('assertion failed: arr[4] should be 1, got ' + arr[4])
  }
  console.log('verified')
}
