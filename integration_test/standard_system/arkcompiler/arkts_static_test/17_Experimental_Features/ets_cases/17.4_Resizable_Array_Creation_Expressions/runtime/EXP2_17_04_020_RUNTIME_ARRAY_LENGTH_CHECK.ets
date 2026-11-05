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
 * @id EXP2_17_04_020_RUNTIME_ARRAY_LENGTH_CHECK
 * @expect runtime
 * @section 17.4
 * @design 数组长度验证：验证通过 array creation expression 创建的数组具有正确的长度
 * @note 运行时用例：实际执行验证数组 length 属性与维度表达式一致
 */
function main(): void {
  let arr = new number[5](0)
  if (arr.length != 5) {
    throw new Error('assertion failed: array length should be 5')
  }

  let arr2 = new string[3]('test')
  if (arr2.length != 3) {
    throw new Error('assertion failed: array length should be 3')
  }

  let dim: int = 7
  let arr3 = new int[dim](0)
  if (arr3.length != 7) {
    throw new Error('assertion failed: array length should be 7')
  }

  console.log('PASS: array length check passed')
}
