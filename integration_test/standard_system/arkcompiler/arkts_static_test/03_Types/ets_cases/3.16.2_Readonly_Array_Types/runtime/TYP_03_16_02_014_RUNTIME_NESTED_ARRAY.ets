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
 * @id TYP_03_16_02_014_RUNTIME_NESTED_ARRAY
 * @expect runtime
 * @section 3.16.2
 * @design 验证数组的数组中内层数组也是只读运行时行为
 * @note 运行时用例：实际执行验证嵌套只读数组
 */
function main(): void {
  let arr: readonly (readonly number[])[] = [[1, 2], [3, 4]]

  if (arr.length !== 2) throw new Error("arr.length should be 2")
  if (arr[0].length !== 2) throw new Error("arr[0].length should be 2")
  if (arr[0][0] !== 1) throw new Error("arr[0][0] should be 1")
  if (arr[0][1] !== 2) throw new Error("arr[0][1] should be 2")
  if (arr[1][0] !== 3) throw new Error("arr[1][0] should be 3")
  if (arr[1][1] !== 4) throw new Error("arr[1][1] should be 4")

  console.log("verified")
}
