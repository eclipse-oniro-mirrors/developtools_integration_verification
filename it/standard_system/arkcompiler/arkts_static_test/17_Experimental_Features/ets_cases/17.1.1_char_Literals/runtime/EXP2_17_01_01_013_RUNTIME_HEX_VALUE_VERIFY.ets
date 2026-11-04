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
 * @id EXP2_17_01_01_013_RUNTIME_HEX_VALUE_VERIFY
 * @expect runtime
 * @section 17.1.1
 * @design 十六进制转义字面量值验证：验证 c'\x41' 等于 c'A'
 * @note 运行时用例：实际执行验证十六进制转义值与对应 ASCII 字符一致
 */
function main(): void {
  let hex41: char = c'\x41'  // 'A'
  let ch_A: char = c'A'
  // c'\x41' should equal c'A'
  if (!(hex41 == ch_A)) {
    throw new Error('assertion failed: c'\\x41' should equal c'A'')
  }
  // c'\x7F' should be 0x7F (127)
  let hex7F: char = c'\x7F'
  if (!(hex7F == 0x7F)) {
    throw new Error('assertion failed: c'\\x7F' should equal 0x7F')
  }
  // c'\x00' should be 0 (NUL)
  let hex00: char = c'\x00'
  if (!(hex00 == 0)) {
    throw new Error('assertion failed: c'\\x00' should equal 0')
  }
  // c'\xFF' should be 255
  let hexFF: char = c'\xFF'
  if (!(hexFF == 255)) {
    throw new Error('assertion failed: c'\\xFF' should equal 255')
  }
  console.log('verified')
}
