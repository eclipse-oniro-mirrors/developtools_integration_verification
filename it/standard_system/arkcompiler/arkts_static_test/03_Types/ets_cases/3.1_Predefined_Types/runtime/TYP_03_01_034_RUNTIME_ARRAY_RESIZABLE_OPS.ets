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
 * @id TYP_03_01_034_RUNTIME_ARRAY_RESIZABLE_OPS
 * @expect runtime
 * @section 3.1
 * @design 可变数组 push/pop/length/索引/迭代运行时行为
 * @note 运行时用例：实际执行验证数组动态行为
 */
function main(): void {
  let arr: int[] = [1, 2, 3]
  if (arr.length != 3) {
    throw new Error("Initial length should be 3")
  }

  arr.push(4)
  if (arr.length != 4) {
    throw new Error("Length after push should be 4")
  }
  if (arr[3] != 4) {
    throw new Error("Last element should be 4")
  }

  let popped: int | undefined = arr.pop()
  if (popped != 4) {
    throw new Error("Popped should be 4")
  }
  if (arr.length != 3) {
    throw new Error("Length after pop should be 3")
  }

  // 索引修改
  arr[0] = 100
  if (arr[0] != 100) {
    throw new Error("Index assign failed")
  }

  // for-of 迭代
  let sum: int = 0
  for (let v of arr) {
    sum += v
  }
  if (sum != 105) {
    throw new Error("Sum should be 105, got " + sum)
  }

  console.log("Array ops verified")
}