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
 * @id LEX_02_09_06_016_RT_STRING_COMPARISON
 * @expect runtime
 * @section 2.9.6
 * @design 字符串比较验证
 * @note runtime 用例：验证字符串比较正确性
 */

function main(): void {
  // 验证相等比较
  let s1: string = "Hello"
  let s2: string = "Hello"
  if (s1 !== s2) { throw new Error("equality failed") }

  // 验证不等比较
  let s3: string = "Hello"
  let s4: string = "World"
  if (s3 === s4) { throw new Error("inequality failed") }

  // 验证空字符串比较
  let s5: string = ""
  let s6: string = ""
  if (s5 !== s6) { throw new Error("empty string equality failed") }

  // 验证大小写敏感
  let s7: string = "hello"
  let s8: string = "Hello"
  if (s7 === s8) { throw new Error("case sensitivity failed") }
}
