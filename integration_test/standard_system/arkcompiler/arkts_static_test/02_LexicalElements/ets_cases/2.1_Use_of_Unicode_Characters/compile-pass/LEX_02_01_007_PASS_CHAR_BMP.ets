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
 * @id LEX_02_01_007_PASS_CHAR_BMP
 * @expect compile-pass
 * @section 2.1
 * @design BMP char字面量: c'...'语法、\uHHHH转义、\xHH转义、特殊转义序列(\n \t \r) * @note 正向用例：验证该特性编译通过的正确用法

 */
function testCharBMP(): void {
  let ch1: char = c'A'
  let ch2: char = c'\u0041'
  let ch3: char = c'\x41'
  let newline: char = c'\n'
  let tab: char = c'\t'
  let ret: char = c'\r'
  let nullCh: char = c'\u0000'
}
