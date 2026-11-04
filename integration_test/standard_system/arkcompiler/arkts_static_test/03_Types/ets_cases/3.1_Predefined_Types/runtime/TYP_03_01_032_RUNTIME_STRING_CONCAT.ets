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
 * @id TYP_03_01_032_RUNTIME_STRING_CONCAT
 * @expect runtime
 * @section 3.1
 * @design 字符串拼接和 length/索引访问
 * @note 运行时用例：实际执行验证字符串运行时行为
 */
function main(): void {
  let hello: string = "Hello"
  let world: string = "World"
  let result: string = hello + " " + world

  if (result != "Hello World") {
    throw new Error("String concat failed: " + result)
  }

  if (result.length != 11) {
    throw new Error("Length should be 11, got " + result.length)
  }

  // 数值/布尔拼接
  let s1: string = "n=" + 42
  if (s1 != "n=42") {
    throw new Error("Int concat failed: " + s1)
  }

  let s2: string = "b=" + true
  if (s2 != "b=true") {
    throw new Error("Bool concat failed: " + s2)
  }

  // 空字符串
  let empty: string = ""
  if (empty.length != 0) {
    throw new Error("Empty string length should be 0")
  }

  console.log("String concat verified")
}