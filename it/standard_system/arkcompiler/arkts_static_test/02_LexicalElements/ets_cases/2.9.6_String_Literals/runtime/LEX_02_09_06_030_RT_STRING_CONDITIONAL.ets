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
 * @id LEX_02_09_06_030_RT_STRING_CONDITIONAL
 * @expect runtime
 * @section 2.9.6
 * @design 字符串条件表达式运行时验证
 * @note runtime 用例：验证字符串在条件表达式中的运行时行为
 */

function main(): void {
  // 字符串长度条件
  let s1 = "Hello"
  let result1 = 0
  if (s1.length > 0) {
    result1 = 1
  }
  if (result1 !== 1) { throw new Error("length > 0 failed, got " + result1) }

  // 空字符串条件
  let s2 = ""
  let result2 = 0
  if (s2.length === 0) {
    result2 = 1
  }
  if (result2 !== 1) { throw new Error("empty string failed, got " + result2) }

  // 字符串比较条件
  let s3 = "Hello"
  let result3 = 0
  if (s1 === s3) {
    result3 = 1
  }
  if (result3 !== 1) { throw new Error("string comparison failed, got " + result3) }

  // 三元表达式
  let s4 = "Hello"
  let result4 = (s4.length > 0) ? "not empty" : "empty"
  if (result4 !== "not empty") { throw new Error("ternary failed, got " + result4) }
}
