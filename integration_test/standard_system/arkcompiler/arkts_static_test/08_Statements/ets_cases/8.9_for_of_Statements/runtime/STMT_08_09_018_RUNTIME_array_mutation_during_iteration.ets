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
 * @id STMT_08_09_018_RUNTIME_array_mutation_during_iteration
 * @expect runtime
 * @section 8.9
 * @design for-of迭代时修改被迭代数组的元素值（非增删）不影响迭代次数
 * @note 运行时用例：验证迭代过程中修改元素值的正确行为
 */
function main(): void {
  let arr: int[] = [1, 2, 3, 4, 5]
  let sum: int = 0
  let count: int = 0
  for (let val of arr) {
    sum += val
    count++
    arr[0] = 99  // modify first element - iteration should continue normally
  }
  if (count != 5) { throw new Error("Expected 5 iterations, got " + count) }
  if (sum != 15) { throw new Error("Expected sum=15, got " + sum) }
  if (arr[0] != 99) { throw new Error("Expected arr[0]=99 after mutation") }
  console.log("verified")
}
