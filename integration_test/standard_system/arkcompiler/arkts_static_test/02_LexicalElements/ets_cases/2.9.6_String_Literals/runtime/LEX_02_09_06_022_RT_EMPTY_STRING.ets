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
 * @id LEX_02_09_06_022_RT_EMPTY_STRING
 * @expect runtime
 * @section 2.9.6
 * @design 空字符串操作验证
 * @note runtime 用例：验证空字符串的特殊行为
 */

function main(): void {
  // 验证空字符串长度
  let s1: string = ""
  if (s1.length !== 0) { throw new Error("empty string length failed") }

  // 验证空字符串拼接
  let s2: string = "" + ""
  if (s2 !== "") { throw new Error("empty + empty failed") }

  let s3: string = "" + "Hello"
  if (s3 !== "Hello") { throw new Error("empty + Hello failed") }

  let s4: string = "Hello" + ""
  if (s4 !== "Hello") { throw new Error("Hello + empty failed") }

  // 验证空字符串比较
  let s5: string = ""
  let s6: string = ""
  if (s5 !== s6) { throw new Error("empty string equality failed") }

  // 验证空字符串与非空字符串比较
  let s7: string = ""
  let s8: string = "Hello"
  if (s7 === s8) { throw new Error("empty vs non-empty failed") }
}
