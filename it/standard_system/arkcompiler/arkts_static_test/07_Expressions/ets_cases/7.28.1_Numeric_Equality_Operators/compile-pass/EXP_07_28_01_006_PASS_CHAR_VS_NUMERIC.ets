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
 * @id EXP_07_28_01_006_PASS_CHAR_VS_NUMERIC
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证 char 类型与数值类型等值比较编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 *       char 文字量使用 c'X' 语法
 */
function main(): void {
  let c: char = c'A';
  let bi: byte = 65;
  let i: int = 65;
  let l: long = 65;
  let f: float = 65.0f;
  let d: double = 65.0;

  // char == byte（均为 int）
  let r1: boolean = c == bi;
  // char == int
  let r2: boolean = c == i;
  // char == long（char → long）
  let r3: boolean = c == l;
  // char == float（char → float）
  let r4: boolean = c == f;
  // char == double（char → double）
  let r5: boolean = c == d;
  // char != int
  let r6: boolean = c != 66;
}
