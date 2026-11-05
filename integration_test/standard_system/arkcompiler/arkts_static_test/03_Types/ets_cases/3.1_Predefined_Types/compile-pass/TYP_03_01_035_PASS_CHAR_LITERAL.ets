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
 * @id TYP_03_01_035_PASS_CHAR_LITERAL
 * @expect compile-pass
 * @section 3.1
 * @design char 类型字面量(c'a' 形式)、Char 别名、char 变量声明
 * @note 正向用例：验证 char 实验特性的字面量和声明
 */
function testCharLiteral(): void {
  let a: char = c'a'
  let b: char = c'A'
  let zero: char = c'\u0000'
  let max: char = c'\uFFFF'
  let escape: char = c'\n'

  let alias: Char = c'X'

  // char 与 Object 兼容
  let o: Object = a
}