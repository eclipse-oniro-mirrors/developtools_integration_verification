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
 * @id EXP2_17_04_021_RUNTIME_ELEMENT_INIT_CHECK
 * @expect runtime
 * @section 17.4
 * @design 元素初始化验证：验证 array creation expression 中所有元素均被正确初始化为指定值
 * @note 运行时用例：实际执行验证数组各索引位置的元素值等于初始化值
 */
function main(): void {
  let arr = new number[4](7)
  if (arr[0] != 7) {
    throw new Error('assertion failed: arr[0] should be 7')
  }
  if (arr[1] != 7) {
    throw new Error('assertion failed: arr[1] should be 7')
  }
  if (arr[2] != 7) {
    throw new Error('assertion failed: arr[2] should be 7')
  }
  if (arr[3] != 7) {
    throw new Error('assertion failed: arr[3] should be 7')
  }

  let arr2 = new string[3]('hello')
  if (arr2[0] != 'hello') {
    throw new Error('assertion failed: arr2[0] should be hello')
  }
  if (arr2[2] != 'hello') {
    throw new Error('assertion failed: arr2[2] should be hello')
  }

  let arr3 = new boolean[2](false)
  if (arr3[0] != false) {
    throw new Error('assertion failed: arr3[0] should be false')
  }
  if (arr3[1] != false) {
    throw new Error('assertion failed: arr3[1] should be false')
  }

  console.log('PASS: element init check passed')
}
