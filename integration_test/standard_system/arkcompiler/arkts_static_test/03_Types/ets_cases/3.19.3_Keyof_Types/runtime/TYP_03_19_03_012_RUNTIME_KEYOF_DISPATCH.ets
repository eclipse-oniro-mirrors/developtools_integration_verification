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
 * @id TYP_03_19_03_012_RUNTIME_KEYOF_DISPATCH
 * @expect runtime
 * @section 3.19.3
 * @design keyof 类型作为字段名集合，可用于分支分发
 * @note 运行时用例：根据 keyof 值分发逻辑
 */
class R12 {
  name: string = "Alice"
  age: int = 30
}
type KeysOfR12 = keyof R12

function getValue(obj: R12, key: KeysOfR12): string {
  if (key == "name") {
    return obj.name
  }
  if (key == "age") {
    return "" + obj.age
  }
  return "unreachable"
}

function main(): void {
  let obj: R12 = new R12()
  if (getValue(obj, "name") != "Alice") {
    throw new Error("name dispatch failed")
  }
  if (getValue(obj, "age") != "30") {
    throw new Error("age dispatch failed")
  }
  console.log("keyof dispatch verified")
}