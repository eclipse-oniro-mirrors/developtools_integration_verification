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
 * @id EXP_07_34_008_PASS_PLAIN_BACKTICK
 * @expect compile-pass
 * @section 7.34
 * @design 验证纯多行反引号字符串（不含嵌入表达式）的编译通过：反引号可作为普通多行字符串字面量使用
 * @note 正向用例：不含 ${} 的反引号字符串是有效字符串字面量，应编译通过
 */
function main(): void {
  // 纯反引号字符串（不含嵌入表达式）
  let r1: string = `hello world`;

  // 多行反引号字符串
  let r2: string = `first line
second line
third line`;

  // 含特殊字符
  let r3: string = `tab\there and newline\nhere`;

  // 与普通字符串相等
  let r4: string = `plain string`;

  console.log('verified');
}
