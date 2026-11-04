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
 * @id TYP_03_16_01_012_RUNTIME_SYNTAX_EQUIVALENCE
 * @expect runtime
 * @section 3.16.1
 * @design 验证 T[] 和 Array<T> 是相同类型运行时行为
 * @note 运行时用例：实际执行验证语法等价性
 */
function main(): void {
  let arr1: number[] = [1, 2, 3]
  let arr2: Array<number> = arr1

  if (arr1 !== arr2) throw new Error("should be same array")
  if (arr1.length !== arr2.length) throw new Error("length should be equal")

  arr2[0] = 100
  if (arr1[0] !== 100) throw new Error("arr1[0] should be 100")

  console.log("verified")
}
