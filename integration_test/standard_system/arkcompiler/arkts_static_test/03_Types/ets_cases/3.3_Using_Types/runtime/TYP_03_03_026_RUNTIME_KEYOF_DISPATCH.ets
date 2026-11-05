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
 * @id TYP_03_03_026_RUNTIME_KEYOF_DISPATCH
 * @expect runtime
 * @section 3.3
 * @design keyof T 在运行时是字符串，可作为字段名查询/分发
 * @note 运行时用例：验证 keyof 类型运行时行为
 */
class C26 {
  name: string = "Alice"
  age: int = 30
}

function main(): void {
  let c: C26 = new C26()

  let k1: keyof C26 = "name"
  if (k1 != "name") {
    throw new Error("keyof value should be 'name'")
  }

  let k2: keyof C26 = "age"
  if (k2 != "age") {
    throw new Error("keyof value should be 'age'")
  }

  console.log("Keyof type runtime verified")
}