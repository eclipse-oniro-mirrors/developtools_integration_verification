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
 * @id EXP2_17_04_01_020_RUNTIME_POSITIVE_DIM_CORRECT_LENGTH_AND_ELEMENTS
 * @expect runtime
 * @section 17.4.1
 * @design 正维度数组创建：验证 new int[5] (42) 创建的数组长度为 5，且所有元素值为 42
 * @note 运行时用例：实际执行验证数组长度和元素初始化正确性
 */
function main(): void {
  let arr: int[] = new int[5] (42)
  // Verify array length
  if (arr.length != 5) {
    throw new Error('assertion failed: array length should be 5, got ' + arr.length)
  }
  // Verify all elements are initialized to 42
  if (arr[0] != 42) {
    throw new Error('assertion failed: arr[0] should be 42, got ' + arr[0])
  }
  if (arr[1] != 42) {
    throw new Error('assertion failed: arr[1] should be 42, got ' + arr[1])
  }
  if (arr[2] != 42) {
    throw new Error('assertion failed: arr[2] should be 42, got ' + arr[2])
  }
  if (arr[3] != 42) {
    throw new Error('assertion failed: arr[3] should be 42, got ' + arr[3])
  }
  if (arr[4] != 42) {
    throw new Error('assertion failed: arr[4] should be 42, got ' + arr[4])
  }
  console.log('verified')
}
