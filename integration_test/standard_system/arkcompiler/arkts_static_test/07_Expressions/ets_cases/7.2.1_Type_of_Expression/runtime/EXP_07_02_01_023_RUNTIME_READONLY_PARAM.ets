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
 * @id EXP_07_02_01_023_RUNTIME_READONLY_PARAM
 * @expect runtime
 * @section 7.2.1
 * @design readonly 数组参数正确传递和读取
 * @note 运行时用例：验证 readonly 数组参数运行时正确
 */
function sumArray(arr: readonly int[]): int {
  let s: int = 0
  for (let i: int = 0; i < arr.length; i++) {
    s += arr[i]
  }
  return s
}

function main(): void {
  let writable: int[] = [1, 2, 3, 4, 5]
  let r1 = sumArray(writable)
  if (r1 != 15) {
    throw new Error('assertion failed: sumArray(writable) != 15, got ' + r1)
  }
  let readonly: readonly int[] = [10, 20, 30]
  let r2 = sumArray(readonly)
  if (r2 != 60) {
    throw new Error('assertion failed: sumArray(readonly) != 60, got ' + r2)
  }
console.log('verified')
}
