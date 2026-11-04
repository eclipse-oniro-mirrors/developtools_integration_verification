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
 * @id EXP2_17_04_01_021_RUNTIME_ZERO_DIM_EMPTY_ARRAY
 * @expect runtime
 * @section 17.4.1
 * @design 零维度数组创建：验证 new int[0] (0) 创建空数组，长度为 0
 * @note 运行时用例：零维度是合法的维度值，应创建空数组而非抛出异常
 */
function main(): void {
  let arr: int[] = new int[0] (0)
  // Verify array length is 0
  if (arr.length != 0) {
    throw new Error('assertion failed: array length should be 0, got ' + arr.length)
  }
  console.log('verified')
}
