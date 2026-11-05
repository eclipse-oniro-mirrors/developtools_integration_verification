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
 * @id EXP_07_24_042_RUNTIME_NEVER_THROWS_RIGHT_ASSOC
 * @expect runtime
 * @section 7.24
 * @design 验证数值幂运算永远不会抛出异常（与 Math.pow() 等价），以及右结合性 2**3**2=2**9=512
 * @note 运行时用例：幂运算不抛异常 + 右结合性
 */
function main(): void {
  let inf: double = 1.0/0.0

  // 基本运算 - 各种合法运算不应抛出异常
  let r1: double = 2.0 ** 10.0
  if (r1 != 1024.0) {
    throw new Error('assertion failed: 2.0**10.0=' + r1)
  }

  // 大数运算不抛异常（溢出到 Infinity）
  let r2: double = 1e200 ** 2.0
  if (r2 != inf) {
    throw new Error('assertion failed: 1e200**2.0 should be Inf, got ' + r2)
  }

  // 极小值（2^-1500 真下溢到 0）
  let r3: double = 2.0 ** (-1500.0)
  if (r3 != 0.0) {
    throw new Error('assertion failed: 2.0**(-1500.0) should be 0, got ' + r3)
  }

  // 右结合性：2**3**2 = 2**(3**2) = 2**9 = 512
  let r4: double = 2.0 ** 3.0 ** 2.0
  if (r4 != 512.0) {
    throw new Error('assertion failed: 2.0**3.0**2.0 should be 512, got ' + r4)
  }

  // 验证右结合不是左结合：2**3**2 != (2**3)**2 = 8**2 = 64
  let r5: double = (2.0 ** 3.0) ** 2.0
  if (r5 != 64.0) {
    throw new Error('assertion failed: (2.0**3.0)**2.0 should be 64, got ' + r5)
  }
  if (r4 == r5) {
    throw new Error('assertion failed: 2**3**2 should differ from (2**3)**2')
  }

  // 小数运算 (Math.pow(1.5, 2) = 2.25)
  let r6: double = 1.5 ** 2.0
  if (r6 != 2.25) {
    throw new Error('assertion failed: 1.5**2.0=' + r6)
  }
console.log('verified')
}
