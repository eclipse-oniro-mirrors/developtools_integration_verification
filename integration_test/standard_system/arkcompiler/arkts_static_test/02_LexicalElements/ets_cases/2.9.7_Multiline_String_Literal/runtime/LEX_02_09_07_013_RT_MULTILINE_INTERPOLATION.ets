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
 * @id LEX_02_09_07_013_RT_MULTILINE_INTERPOLATION
 * @expect runtime
 * @section 2.9.7
 * @design 多行字符串插值运行时验证
 * @note runtime 用例：验证多行字符串插值的运行时行为
 */

function main(): void {
  // 多行字符串插值
  let name = "World"
  let s1 = `Hello, ${name}!`
  if (s1 !== "Hello, World!") { throw new Error("interpolation failed, got " + s1) }

  // 表达式插值
  let x = 10
  let y = 20
  let s2 = `Sum: ${x + y}`
  if (s2 !== "Sum: 30") { throw new Error("expression interpolation failed, got " + s2) }

  // 多行插值
  let s3 = `Line 1: ${name}
Line 2: ${x + y}`
  let expected = "Line 1: World\nLine 2: 30"
  if (s3 !== expected) { throw new Error("multiline interpolation failed, got " + s3) }
}
