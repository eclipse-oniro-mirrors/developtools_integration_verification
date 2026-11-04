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
 * @id EXP_07_23_03_031_RUNTIME_INT_REMAINDER_SIGN_MAGNITUDE
 * @expect runtime
 * @section 7.23.3
 * @design 验证整数取余符号和大小规则。
 *         spec：结果符号与被除数相同，结果绝对值小于除数绝对值。
 *         恒等式：(a/b)*b + (a%b) == a
 * @note 运行时用例：验证整数取余符号规则和恒等式
 */
function main(): void {
  // 正数 % 正数 = 正
  let r1: int = 10 % 3
  if (r1 != 1) {
    throw new Error('10%3 should be 1, got ' + r1)
  }
  // 验证恒等式
  if ((10/3)*3 + (10%3) != 10) {
    throw new Error('Identity failed for 10%3')
  }

  // 负数 % 正数 = 负（与被除数同号）
  let r2: int = (-10) % 3
  if (r2 != -1) {
    throw new Error('(-10)%3 should be -1, got ' + r2)
  }
  if (((-10)/3)*3 + r2 != -10) {
    throw new Error('Identity failed for (-10)%3')
  }

  // 正数 % 负数 = 正（与被除数同号）
  let r3: int = 10 % (-3)
  if (r3 != 1) {
    throw new Error('10%(-3) should be 1, got ' + r3)
  }

  // 负数 % 负数 = 负（与被除数同号）
  let r4: int = (-10) % (-3)
  if (r4 != -1) {
    throw new Error('(-10)%(-3) should be -1, got ' + r4)
  }

  // |结果| < |除数|
  let absR: int = r1
  if (absR >= 3) {
    throw new Error('|result| should be < |divisor|')
  }

  // long 取余（不使用 L 后缀）
  let r5: long = 100 % 30
  if (r5 != 10) {
    throw new Error('100%30 should be 10 (long), got ' + r5)
  }
console.log('verified')
}
main()
