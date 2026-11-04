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
 * @id TYP_03_17_02_025_RUNTIME_TUPLE_ELEMENT_ACCESS_WRITE
 * @expect runtime
 * @section 3.17.2
 * @design 验证元组元素访问与修改运行时行为（spec/types.md:1177-1190）
 * @note 运行时用例：验证元组索引读写和元素类型
 */
function main(): void {
  let tuple: [number, string, boolean] = [1, "abc", true]

  if (tuple[0] !== 1) throw new Error("tuple[0] should be 1")
  if (tuple[1] !== "abc") throw new Error("tuple[1] should be 'abc'")
  if (tuple[2] !== true) throw new Error("tuple[2] should be true")

  tuple[0] = 42
  tuple[1] = "xyz"
  tuple[2] = false

  if (tuple[0] !== 42) throw new Error("tuple[0] should be 42 after write")
  if (tuple[1] !== "xyz") throw new Error("tuple[1] should be 'xyz' after write")
  if (tuple[2] !== false) throw new Error("tuple[2] should be false after write")

  console.log("verified")
}