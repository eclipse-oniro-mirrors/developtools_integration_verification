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
 * @id LEX_02_09_07_016_RT_MULTILINE_FUNC
 * @expect runtime
 * @section 2.9.7
 * @design 多行字符串在函数中运行时验证
 * @note runtime 用例：验证多行字符串在函数中的运行时行为
 */

function getMultiline(): string {
  return `Line 1
Line 2`
}

function printMultiline(s: string): string {
  return s
}

function main(): void {
  // 多行字符串作为返回值
  let s1 = getMultiline()
  let expected = "Line 1\nLine 2"
  if (s1 !== expected) { throw new Error("getMultiline failed, got " + s1) }

  // 多行字符串作为参数
  let s2 = `Hello
World`
  let s3 = printMultiline(s2)
  if (s3 !== s2) { throw new Error("printMultiline failed, got " + s3) }

  // 多行字符串拼接
  let s4 = `Line 1`
  let s5 = `Line 2`
  let s6 = s4 + "\n" + s5
  if (s6 !== expected) { throw new Error("concat failed, got " + s6) }
}
