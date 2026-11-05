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
 * @id EXP2_17_01_01_011_RUNTIME_ASCII_VALUE_VERIFY
 * @expect runtime
 * @section 17.1.1
 * @design ASCII char 字面量值验证：验证 c'a' 等于 0x61，c'0' 等于 0x30
 * @note 运行时用例：实际执行验证 ASCII char 字面量的码点值
 */
function main(): void {
  let ch_a: char = c'a'
  let ch_0: char = c'0'
  // c'a' should equal 0x61 (97)
  if (!(ch_a == 0x61)) {
    throw new Error('assertion failed: c'a' should equal 0x61, got comparison false')
  }
  if (!(ch_a == 97)) {
    throw new Error('assertion failed: c'a' should equal 97')
  }
  // c'0' should equal 0x30 (48)
  if (!(ch_0 == 0x30)) {
    throw new Error('assertion failed: c'0' should equal 0x30')
  }
  // c'A' should equal 65
  let ch_A: char = c'A'
  if (!(ch_A == 65)) {
    throw new Error('assertion failed: c'A' should equal 65')
  }
  console.log('verified')
}
