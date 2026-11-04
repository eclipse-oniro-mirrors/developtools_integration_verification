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
 * @id TYP_03_17_010_RUNTIME_BASIC_TUPLE
 * @expect runtime
 * @section 3.17
 * @design 验证基本元组运行时行为
 * @note 运行时用例：实际执行验证元组
 */
function main(): void {
  let tuple: [number, number, string, boolean, Object] = [6, 7, "abc", true, 42]

  if (tuple[0] !== 6) throw new Error("tuple[0] should be 6")
  if (tuple[1] !== 7) throw new Error("tuple[1] should be 7")
  if (tuple[2] !== "abc") throw new Error("tuple[2] should be abc")
  if (tuple[3] !== true) throw new Error("tuple[3] should be true")
  if (tuple[4] !== 42) throw new Error("tuple[4] should be 42")

  console.log("verified")
}
