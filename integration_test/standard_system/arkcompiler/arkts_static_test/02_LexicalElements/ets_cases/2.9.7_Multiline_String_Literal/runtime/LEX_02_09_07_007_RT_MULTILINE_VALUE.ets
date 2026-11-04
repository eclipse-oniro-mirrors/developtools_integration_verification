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
 * @id LEX_02_09_07_007_RT_MULTILINE_VALUE
 * @expect runtime
 * @section 2.9.7
 * @design 多行字符串值验证
 * @note runtime 用例：验证多行字符串的值
 */

function main(): void {
  // 验证简单多行字符串
  let s1 = `Hello`
  if (s1 !== "Hello") { throw new Error("simple multiline failed, got " + s1) }

  // 验证包含换行的多行字符串
  let s2 = `Line 1
Line 2`
  let expected = "Line 1\nLine 2"
  if (s2 !== expected) { throw new Error("multiline with newline failed, got " + s2) }

  // 验证空多行字符串
  let s3 = ``
  if (s3 !== "") { throw new Error("empty multiline failed, got " + s3) }
}
