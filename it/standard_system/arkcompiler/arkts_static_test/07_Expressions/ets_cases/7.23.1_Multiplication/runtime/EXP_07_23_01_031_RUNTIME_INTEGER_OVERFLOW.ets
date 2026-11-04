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
 * @id EXP_07_23_01_031_RUNTIME_INTEGER_OVERFLOW
 * @expect runtime
 * @section 7.23.1
 * @design 验证整数乘法溢出的低 32 位截断行为。
 *         spec：overflow 时结果为数学乘积的低位 two's-complement 表示，
 *         结果符号可能与数学乘积不同。
 * @note 运行时用例：int 溢出取低 32 位，验证 2147483647*2=-2
 */
function main(): void {
  // int 最大值为 2147483647
  let maxInt: int = 2147483647
  // maxInt * 2 = 4294967294，低 32 位为 0xFFFFFFFE = -2
  let overflow1: int = maxInt * 2
  if (overflow1 != -2) {
    throw new Error('maxInt*2 should be -2 (overflow), got ' + overflow1)
  }

  // 2147483647 * (-1) = -2147483647（不溢出）
  let noOverflow: int = maxInt * (-1)
  if (noOverflow != -2147483647) {
    throw new Error('maxInt*(-1) should be -2147483647, got ' + noOverflow)
  }

  // 100000 * 100000 = 10000000000 不溢出 int 范围？
  // 实际上 100000*100000 = 10000000000 > 2147483647，溢出
  let overflow2: int = 100000 * 100000
  // 100000*100000 = 10000000000 = 0x02540BE400
  // 低 32 位 = 0x540BE400 = 1410065408
  if (overflow2 != 1410065408) {
    throw new Error('100000*100000 should be 1410065408 (overflow), got ' + overflow2)
  }

  // 验证溢出时不抛出异常（spec 保证）
  console.log('verified')
}
main()
