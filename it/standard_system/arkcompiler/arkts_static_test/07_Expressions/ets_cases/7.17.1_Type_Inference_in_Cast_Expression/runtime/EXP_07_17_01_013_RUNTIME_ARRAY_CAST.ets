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
 * @id EXP_07_17_01_013_RUNTIME_ARRAY_CAST
 * @expect runtime
 * @section 7.17.1
 * @design 验证数组字面量 as double[] 运行时元素值正确
 * @note 运行时用例：int 数组 as double[] 后元素值验证
 */
function main(): void {
  let arr = [1, 2] as double[]
  if (arr[0] != 1.0) {
    throw new Error('assertion failed: expected 1.0, got ' + arr[0])
  }
  if (arr[1] != 2.0) {
    throw new Error('assertion failed: expected 2.0, got ' + arr[1])
  }
console.log('verified')
}
