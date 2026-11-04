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
 * @id EXP2_17_16_1_022_RUNTIME_TUPLE_VALUES
 * @expect runtime
 * @section 17.16.1
 * @design 运行时验证元组解构提取的值正确（含不同类型）
 * @note 运行时用例：实际执行验证从 [int, string] 元组解构出正确类型和值
 */
function main(): void {
  let tup: [int, string] = [42, 'world']
  let [num, str] = tup
  if (num != 42) {
    throw new Error('FAIL: num should be 42, got: ' + num)
  }
  if (str != 'world') {
    throw new Error("FAIL: str should be 'world', got: " + str)
  }
  console.log('PASS: tuple destructuring correct: num=' + num + ' str=' + str)
}
