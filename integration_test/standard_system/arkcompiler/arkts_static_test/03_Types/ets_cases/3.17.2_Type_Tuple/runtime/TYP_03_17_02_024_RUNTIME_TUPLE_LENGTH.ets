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
 * @id TYP_03_17_02_024_RUNTIME_TUPLE_LENGTH
 * @expect runtime
 * @section 3.17.2
 * @design 验证 tuple.length 运行时行为（spec/types.md:1192-1200）
 * @note 运行时用例：验证 length 属性返回正确元素数量
 */
function main(): void {
  let tuple: [number, string] = [1, ""]
  if (tuple.length !== 2) throw new Error("tuple length should be 2")

  let single: [number] = [42]
  if (single.length !== 1) throw new Error("single length should be 1")

  let empty: [] = []
  if (empty.length !== 0) throw new Error("empty length should be 0")

  let triple: [number, number, number] = [1, 2, 3]
  if (triple.length !== 3) throw new Error("triple length should be 3")

  console.log("verified")
}