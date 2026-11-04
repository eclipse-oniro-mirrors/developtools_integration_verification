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
 * @id LEX_02_09_06_029_RT_STRING_METHODS
 * @expect runtime
 * @section 2.9.6
 * @design 字符串方法运行时验证
 * @note runtime 用例：验证字符串方法的运行时行为
 */

function main(): void {
  // substring
  let s1 = "Hello"
  let s2 = s1.substring(0, 3)
  if (s2 !== "Hel") { throw new Error("substring(0,3) failed, got " + s2) }

  // toUpperCase
  let s3 = s1.toUpperCase()
  if (s3 !== "HELLO") { throw new Error("toUpperCase failed, got " + s3) }

  // toLowerCase
  let s4 = s1.toLowerCase()
  if (s4 !== "hello") { throw new Error("toLowerCase failed, got " + s4) }

  // trim
  let s5 = "  Hello  "
  let s6 = s5.trim()
  if (s6 !== "Hello") { throw new Error("trim failed, got " + s6) }

  // replace
  let s7 = s1.replace("l", "L")
  if (s7 !== "HeLlo") { throw new Error("replace failed, got " + s7) }

  // includes
  let s8 = "Hello World"
  if (!s8.includes("World")) { throw new Error("includes failed") }

  // indexOf
  let s9 = "Hello World"
  let idx = s9.indexOf("World")
  if (idx !== 6) { throw new Error("indexOf failed, got " + idx) }
}
