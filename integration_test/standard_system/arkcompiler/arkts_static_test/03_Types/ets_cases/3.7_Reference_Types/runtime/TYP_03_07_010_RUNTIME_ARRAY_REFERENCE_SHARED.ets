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
 * @id TYP_03_07_010_RUNTIME_ARRAY_REFERENCE_SHARED
 * @expect runtime
 * @section 3.7
 * @design 数组也是引用类型，共享元素状态
 * @note 运行时用例：array 引用语义
 */
function main(): void {
  let a: int[] = [1, 2, 3]
  let b: int[] = a   // 同一数组

  a.push(4)
  if (b.length != 4) {
    throw new Error("b should see a.push(4)")
  }

  b[0] = 100
  if (a[0] != 100) {
    throw new Error("a should see b[0] = 100")
  }

  console.log("Array reference shared verified")
}