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
 * @id EXP_07_25_02_032_RUNTIME_INT_OVERFLOW
 * @expect runtime
 * @section 7.25.2
 * @design 验证 int 加法溢出行为：MAX_INT+1=MIN_INT（低位截断，符号相反）。
 *         spec：溢出时结果是数学和在足够大的二进制补码格式中的低位，
 *         结果符号与数学和相反。
 * @note 运行时用例：int 溢出行为
 */
function main(): void {
  let max: int = 2147483647

  // MAX_INT + 1 = MIN_INT (-2147483648)
  let r1: int = max + 1
  let expected1: int = -2147483648
  if (r1 != expected1) {
    throw new Error('MAX_INT+1 should be MIN_INT(-2147483648), got ' + r1)
  }

  // MIN_INT + (-1) = MAX_INT (wrap around)
  let min: int = -2147483648
  let r2: int = min + (-1)
  let expected2: int = 2147483647
  if (r2 != expected2) {
    throw new Error('MIN_INT+(-1) should be MAX_INT(2147483647), got ' + r2)
  }

  // 大型加法溢出
  let r3: int = 2000000000 + 2000000000
  // 2000000000 + 2000000000 = 4000000000 which overflows int
  // 4000000000 - 2^32 = 4000000000 - 4294967296 = -294967296
  let expected3: int = -294967296
  if (r3 != expected3) {
    throw new Error('2000000000+2000000000 should be -294967296, got ' + r3)
  }
console.log('verified')
}
main()
