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
 * @id EXP_07_23_02_001_PASS_BYTE_SHORT_PROMOTION
 * @expect compile-pass
 * @section 7.23.2
 * @design 验证 byte/byte→int、short/short→int 隐式类型提升除法。
 *         byte 和 short 在算术运算中自动提升到 int。
 * @note 正向用例：验证除法运算符中 byte/short 自动提升到 int
 */
function main(): void {
  let a: byte = 6
  let b: byte = 3
  let c: short = 20
  let d: short = 10

  // byte / byte → int
  let r1 = a / b
  let r1Type = typeof(r1)
  if (r1Type != 'int') {
    throw new Error('byte/byte should be int, got ' + r1Type)
  }

  // short / short → int
  let r2 = c / d
  let r2Type = typeof(r2)
  if (r2Type != 'int') {
    throw new Error('short/short should be int, got ' + r2Type)
  }

  // byte / short → int
  let r3 = a / c
  let r3Type = typeof(r3)
  if (r3Type != 'int') {
    throw new Error('byte/short should be int, got ' + r3Type)
  }
console.log('verified')
}
main()
