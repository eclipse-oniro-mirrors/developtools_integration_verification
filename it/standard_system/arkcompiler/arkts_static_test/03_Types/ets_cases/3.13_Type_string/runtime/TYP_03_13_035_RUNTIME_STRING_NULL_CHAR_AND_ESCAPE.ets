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
 * @id TYP_03_13_035_RUNTIME_STRING_NULL_CHAR_AND_ESCAPE
 * @expect runtime
 * @section 3.13
 * @design 验证 string 包含 \0 字符和转义字符的运行时行为
 * @note 运行时用例：验证 \0 是普通字符，转义字符正确处理
 */
function main(): void {
  let s: string = "a\0b"
  if (s.length !== 3) throw new Error("null char length assert failed, got: " + s.length.toString())

  let newline: string = "line1\nline2"
  if (newline.length !== 11) throw new Error("newline length assert failed, got: " + newline.length.toString())

  let tab: string = "tab\there"
  if (tab.length !== 8) throw new Error("tab length assert failed, got: " + tab.length.toString())

  let quote: string = "quote\"inside"
  if (quote.length !== 12) throw new Error("quote length assert failed, got: " + quote.length.toString())

  let backslash: string = "back\\slash"
  if (backslash.length !== 10) throw new Error("backslash length assert failed, got: " + backslash.length.toString())

  console.log("TYP_03_13_035 verified")
}