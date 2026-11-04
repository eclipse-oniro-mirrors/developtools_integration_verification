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
 * @id TYP_03_17_02_019_RUNTIME_EMPTY_TUPLE
 * @expect runtime
 * @section 3.17.2
 * @design 验证空元组运行时等同于 Tuple（spec/types.md:1240-1245）
 * @note 运行时用例：空元组 instanceof Tuple 应为 true
 */
function main(): void {
  let empty: [] = []
  if (!(empty instanceof Tuple)) throw new Error("empty should be Tuple")
  if (empty.length !== 0) throw new Error("empty length should be 0")
  console.log("verified")
}