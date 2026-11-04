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
 * @id TYP_03_17_02_020_RUNTIME_INSTANCEOF_TUPLE
 * @expect runtime
 * @section 3.17.2
 * @design 验证 instanceof Tuple 运行时行为（spec/types.md:1269-1270）
 * @note 运行时用例：验证元组 instanceof Tuple 为 true，非元组为 false
 */
function main(): void {
  let pair: [number, string] = [1, "abc"]
  if (!(pair instanceof Tuple)) throw new Error("pair should be Tuple")

  let obj: Object = new Object()
  if (obj instanceof Tuple) throw new Error("plain Object should not be Tuple")

  console.log("verified")
}