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
 * @id TYP_03_16_013_RUNTIME_ARRAY_ITERABLE
 * @expect runtime
 * @section 3.16
 * @design 验证数组可迭代运行时行为
 * @note 运行时用例：实际执行验证数组遍历
 */
function main(): void {
  let arr: number[] = [1, 2, 3, 4, 5]
  let sum: number = 0

  for (let n of arr) {
    sum = sum + n
  }

  if (sum !== 15) throw new Error("sum should be 15")

  console.log("verified")
}
