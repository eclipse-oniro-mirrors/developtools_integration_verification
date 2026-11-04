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
 * @id EXP2_17_04_01_024_RUNTIME_LARGE_DIMENSION
 * @expect runtime
 * @section 17.4.1
 * @design 大维度数组创建：验证 new int[1000] (0) 创建长度为 1000 的数组
 * @note 运行时用例：非 OutOfMemory 的大维度值，验证数组正确创建
 */
function main(): void {
  let arr: int[] = new int[1000] (0)
  // Verify array length
  if (arr.length != 1000) {
    throw new Error('assertion failed: array length should be 1000, got ' + arr.length)
  }
  // Verify first and last elements are initialized to 0
  if (arr[0] != 0) {
    throw new Error('assertion failed: arr[0] should be 0, got ' + arr[0])
  }
  if (arr[999] != 0) {
    throw new Error('assertion failed: arr[999] should be 0, got ' + arr[999])
  }
  console.log('verified')
}
