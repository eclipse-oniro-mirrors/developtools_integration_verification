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
 * @id EXP_07_03_001_PASS_INTEGER_LITERAL
 * @expect compile-pass
 * @section 7.3
 * @design 验证整数字面量在所有进制形式下编译通过：十进制、十六进制、八进制、二进制
 * @note 正向用例：验证整数字面量作为表达式的基本编译通过用法
 */
function main(): void {
  let dec: int = 42
  let hex: int = 0xFF
  let oct: int = 0o77
  let bin: int = 0b1010
  let zero: int = 0
  let maxInt: int = 0x7FFFFFFF
  let largeLong: long = 0x8000_0000
  let neg: int = -10
  console.log('verified')
}
