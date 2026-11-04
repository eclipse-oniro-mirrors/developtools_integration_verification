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
 * @id TYP_03_13_036_PASS_STRING_AS_CLASS_TYPE
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 是类类型，可在需要类名的地方使用（如泛型参数）
 * @note 正向用例：string 可以用作泛型参数、类字段类型、函数参数类型等
 */
class Container<T> {
  value: T
  constructor(v: T) { this.value = v }
}

function greet(name: string): string {
  return "Hello, " + name
}

let globalStr: string = "world"

function main(): void {
  let c: Container<string> = new Container<string>("test")
  let result: string = greet("ArkTS")
  if (c.value !== "test") throw new Error("container assert failed")
  if (result !== "Hello, ArkTS") throw new Error("greet assert failed")
  console.log("verified")
}