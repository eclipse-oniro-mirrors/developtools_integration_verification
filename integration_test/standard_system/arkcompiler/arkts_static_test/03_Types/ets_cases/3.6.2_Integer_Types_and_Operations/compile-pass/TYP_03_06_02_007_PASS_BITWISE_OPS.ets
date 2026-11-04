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
 * @id TYP_03_06_02_007_PASS_BITWISE_OPS
 * @expect compile-pass
 * @section 3.6.2
 * @design 按位运算 & ^ |
 * @note 正向用例：按位与/异或/或
 */
function testBitwiseOps(): void {
  let a: int = 0b1100
  let b: int = 0b1010

  let andR: int = a & b   // 0b1000 = 8
  let xorR: int = a ^ b   // 0b0110 = 6
  let orR: int = a | b    // 0b1110 = 14

  let lo1: long = 0xFF
  let lo2: long = 0x0F
  let andL: long = lo1 & lo2
  let xorL: long = lo1 ^ lo2
  let orL: long = lo1 | lo2
}