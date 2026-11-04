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
 * @id TYP_03_13_012_PASS_STRING_NULL_CHAR
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 可包含 \0 字符（不是终止符）
 * @note 正向用例：\0 是普通字符，length 包含它
 */
let s: string = "a\0b"

function main(): void {
  if (s.length !== 3) throw new Error("null char length assert failed")
  console.log("verified")
}