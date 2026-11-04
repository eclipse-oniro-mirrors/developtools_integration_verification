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
 * @id EXP2_17_08_01_011_RUNTIME_FOR_OF_INT_EXPLICIT_ITERATE
 * @expect runtime
 * @section 17.8.1
 * @design for-of 显式 int 类型遍历 int[]：运行时验证每次迭代值和循环总次数
 * @note 运行时用例：实际执行验证带有显式类型注释的 for-of 循环迭代行为
 */
function main(): void {
  let arr: int[] = [10, 20, 30, 40, 50]
  let expectedValues: int[] = [10, 20, 30, 40, 50]
  let idx: int = 0
  for (let v: int of arr) {
    if (v != expectedValues[idx]) {
      throw new Error('assertion failed: expected ' + expectedValues[idx] + ' but got ' + v)
    }
    idx = idx + 1
  }
  if (idx != 5) {
    throw new Error('assertion failed: expected 5 iterations but got ' + idx)
  }
  console.log('verified')
}
