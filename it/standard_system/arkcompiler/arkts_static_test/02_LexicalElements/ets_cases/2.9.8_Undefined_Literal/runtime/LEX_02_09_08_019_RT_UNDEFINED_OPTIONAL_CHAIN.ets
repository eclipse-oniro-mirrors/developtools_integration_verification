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
 * @id LEX_02_09_08_019_RT_UNDEFINED_OPTIONAL_CHAIN
 * @expect runtime
 * @section 2.9.8
 * @design undefined 在可选链中
 * @note runtime 用例：验证 undefined 在可选链中的运行时行为
 */

interface Nested {
  value: int
}

interface Obj {
  name: string
  nested?: Nested
}

function main(): void {
  // undefined 在可选链中
  let obj: Obj = { name: "test" }
  let x: int | undefined = obj.nested?.value
  if (x !== undefined) {
    throw new Error("optional chain failed, got " + x)
  }
}
