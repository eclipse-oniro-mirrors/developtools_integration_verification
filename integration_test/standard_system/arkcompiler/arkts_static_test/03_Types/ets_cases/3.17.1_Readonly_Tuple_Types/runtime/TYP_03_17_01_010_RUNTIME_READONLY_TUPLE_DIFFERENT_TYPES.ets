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
 * @id TYP_03_17_01_010_RUNTIME_READONLY_TUPLE_DIFFERENT_TYPES
 * @expect runtime
 * @section 3.17.1
 * @design 验证只读元组包含不同类型元素运行时行为
 * @note 运行时用例：实际执行验证不同类型只读元组
 */
function main(): void {
  let tuple: readonly [number, string, boolean, int] = [1, "hello", true, 42]

  if (tuple[0] !== 1) throw new Error("tuple[0] should be 1")
  if (tuple[1] !== "hello") throw new Error("tuple[1] should be hello")
  if (tuple[2] !== true) throw new Error("tuple[2] should be true")
  if (tuple[3] !== 42) throw new Error("tuple[3] should be 42")

  console.log("verified")
}
