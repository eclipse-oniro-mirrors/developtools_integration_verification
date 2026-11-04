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
 * @id EXP_07_23_03_038_RUNTIME_FLOAT_REMAINDER_SPECIAL
 * @expect runtime
 * @section 7.23.3
 * @design 验证浮点取余特殊值规则。
 *         spec：
 *         - 有限被除数 % Infinity = 被除数（结果等于被除数）
 *         - 0 % 有限除数 = 0
 *         - r = n - (d * q)，q 是不超过 |n/d| 的最大整数
 * @note 运行时用例：验证浮点取余特殊值和 r = n - (d*q) 公式
 */
function main(): void {
  let inf: double = 1.0 / 0.0

  // finite % Infinity = dividend
  let r1: double = 3.5 % inf
  if (r1 != 3.5) {
    throw new Error('3.5%Inf should be 3.5, got ' + r1)
  }

  // 0 % finite = 0
  let r2: double = 0.0 % 3.5
  if (r2 != 0.0) {
    throw new Error('0%3.5 should be 0.0, got ' + r2)
  }

  // 负有限数 % Infinity = 被除数
  let r3: double = (-3.5) % inf
  if (r3 != -3.5) {
    throw new Error('(-3.5)%Inf should be -3.5, got ' + r3)
  }

  // 验证 r = n - (d * q) 公式
  // 10.5 % 3.0：n=10.5, d=3.0, q=3 (|10.5/3|=3.5, q取最大不超3.5 → 3)
  // r = 10.5 - (3.0 * 3) = 10.5 - 9.0 = 1.5
  let n: double = 10.5
  let d: double = 3.0
  let r4: double = n % d
  let expected: double = n - (d * 3.0)
  if (Math.abs(r4 - expected) > 0.0001) {
    throw new Error('r = n-(d*q) formula failed: ' + r4 + ' vs ' + expected)
  }

  // 负数情况：(-10.5) % 3.0：n=-10.5, d=3.0, q=-3
  // r = -10.5 - (3.0 * (-3)) = -10.5 + 9.0 = -1.5
  let r5: double = (-10.5) % 3.0
  let expected2: double = (-10.5) - (3.0 * (-3))
  if (Math.abs(r5 - expected2) > 0.0001) {
    throw new Error('Negative formula failed: ' + r5 + ' vs ' + expected2)
  }
console.log('verified')
}
main()
