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
 * @id LEX_02_09_07_008_RT_ESCAPE_VALUE
 * @expect runtime
 * @section 2.9.7
 * @design 转义序列值验证
 * @note runtime 用例：验证多行字符串中转义序列的值
 */

function main(): void {
  // 验证转义反引号
  let s1 = `This is a \` backtick`
  if (s1 !== "This is a ` backtick") { throw new Error("escaped backtick failed, got " + s1) }

  // 验证转义反斜杠
  let s2 = `This is a \\ backslash`
  if (s2 !== "This is a \\ backslash") { throw new Error("escaped backslash failed, got " + s2) }

  // 验证制表符转义
  let s3 = `Tab:\t`
  if (s3 !== "Tab:\t") { throw new Error("tab escape failed, got " + s3) }

  // 验证换行符转义
  let s4 = `Newline:\n`
  if (s4 !== "Newline:\n") { throw new Error("newline escape failed, got " + s4) }
}
