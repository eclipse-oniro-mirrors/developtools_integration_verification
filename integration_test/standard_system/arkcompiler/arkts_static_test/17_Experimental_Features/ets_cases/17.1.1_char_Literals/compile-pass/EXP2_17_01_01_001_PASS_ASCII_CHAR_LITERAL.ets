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
 * @id EXP2_17_01_01_001_PASS_ASCII_CHAR_LITERAL
 * @expect compile-pass
 * @section 17.1.1
 * @design 基本 ASCII 字符字面量：验证 c'X' 语法声明各项可打印 ASCII 字符
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testAsciiCharLiteral(): void {
  let lowercase: char = c'a'
  let uppercase: char = c'Z'
  let digit: char = c'0'
  let space: char = c' '
  let exclam: char = c'!'
  let tilde: char = c'~'
  console.log(lowercase)
  console.log(uppercase)
  console.log(digit)
  console.log(space)
  console.log(exclam)
  console.log(tilde)
}
