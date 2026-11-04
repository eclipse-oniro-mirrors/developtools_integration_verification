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
 * @id EXP_07_24_035_RUNTIME_ZERO_BASE_NEGATIVE_EXPONENT
 * @expect runtime
 * @section 7.24
 * @design 验证 +/-0 ** y 负指数规则：+0**(-3)=+Infinity, +0**(-2)=+Infinity, (-0)**(-3)=-Infinity, (-0)**(-2)=+Infinity
 * @note 运行时用例：IEEE 754 零基底负指数规则（+0 总是出 +Inf，-0 仅在奇指时出 -Inf）
 */
function main(): void {
  let inf: double = 1.0/0.0
  let negZero: double = -1.0/inf

  // +0**(-3) = +Infinity（负奇整数，但 +0 对任何负指数都出 +Inf）
  let r1: double = 0.0 ** (-3.0)
  if (r1 != inf) {
    throw new Error('assertion failed: 0.0**(-3.0)=' + r1)
  }

  // +0**(-2) = +Infinity（负偶整数）
  let r2: double = 0.0 ** (-2.0)
  if (r2 != inf) {
    throw new Error('assertion failed: 0.0**(-2.0)=' + r2)
  }

  // (-0)**(-3) = -Infinity（-0 的负奇整数指数出 -Inf）
  let r3: double = negZero ** (-3.0)
  if (r3 != -inf) {
    throw new Error('assertion failed: (-0)**(-3.0)=' + r3)
  }

  // (-0)**(-2) = +Infinity（-0 的负偶整数指数出 +Inf）
  let r4: double = negZero ** (-2.0)
  if (r4 != inf) {
    throw new Error('assertion failed: (-0)**(-2.0)=' + r4)
  }
console.log('verified')
}
