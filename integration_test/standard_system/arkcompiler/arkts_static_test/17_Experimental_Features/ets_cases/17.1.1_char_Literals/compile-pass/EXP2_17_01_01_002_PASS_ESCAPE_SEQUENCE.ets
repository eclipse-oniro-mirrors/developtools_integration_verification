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
 * @id EXP2_17_01_01_002_PASS_ESCAPE_SEQUENCE
 * @expect compile-pass
 * @section 17.1.1
 * @design 转义序列字面量：验证 c'\n', c'\t', c'\r', c'\\', c'\'' 等转义序列
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testEscapeSequenceLiteral(): void {
  let newline: char = c'\n'
  let tab: char = c'\t'
  let carriage_return: char = c'\r'
  let backslash: char = c'\\'
  let single_quote: char = c'\''
  // Also test c'\"' (double quote escape in char literal)
  let double_quote: char = c'"'
  console.log(newline)
  console.log(tab)
  console.log(carriage_return)
  console.log(backslash)
  console.log(single_quote)
  console.log(double_quote)
}
