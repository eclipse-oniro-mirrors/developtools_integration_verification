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
 * @id EXP_07_32_02_007_PASS_SHIFT_BITWISE_COMPOUND
 * @expect compile-pass
 * @section 7.32.2
 * @design 验证移位和位运算复合赋值运算符的编译通过：<<=、>>=、>>>=、&=、|=、^= 在 int/long 类型上的使用，以及 boolean 位运算
 * @note 正向用例：移位复合操作左侧操作数决定结果类型（int 移位→int，long 移位→long）。布尔 &= |= ^= 也验证
 */
function main(): void {
  // === int 移位复合 ===
  let a: int = 16;
  a <<= 2;    // 16 << 2 = 64
  a >>= 1;    // 64 >> 1 = 32
  a >>>= 1;   // 32 >>> 1 = 16

  // === long 移位复合 ===
  let b: long = 100;
  b <<= 2;
  b >>= 1;
  b >>>= 1;

  // === int 位运算复合 ===
  let c: int = 0xFF;
  c &= 0x0F;  // 0xFF & 0x0F = 0x0F
  c |= 0xF0;  // 0x0F | 0xF0 = 0xFF
  c ^= 0xAA;  // 0xFF ^ 0xAA = 0x55

  // === long 位运算复合 ===
  let d: long = 0xFF;
  d &= 0x0F;
  d |= 0xF0;
  d ^= 0xAA;

  // === boolean 位运算复合 ===
  let e: boolean = true;
  e &= false;  // true & false = false
  e |= true;   // false | true = true
  e ^= true;   // true ^ true = false

  console.log('verified');
}
