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
 * @id EXP_07_24_041_RUNTIME_NEGATIVE_BASE_NON_INTEGER_EXPONENT
 * @expect runtime
 * @section 7.24
 * @design 验证有限负 x ** 有限非整数 y = NaN；注意：ArkTS 的 ** 对负数基底任何 double 指数（包括整数）都返回 NaN（与 IEEE 754 pow 行为不同）
 * @note 运行时用例：负数基底非整数指数验证，ArkTS 对所有负数基底 ** double 返回 NaN
 */
function main(): void {
  // (-2.0) ** 0.5 = NaN (平方根负数为 NaN)
  let r1: double = (-2.0) ** 0.5
  if (r1 == r1) {
    throw new Error('assertion failed: (-2.0)**0.5 should be NaN')
  }

  // (-3.0) ** 2.5 = NaN（非整数指数）
  let r2: double = (-3.0) ** 2.5
  if (r2 == r2) {
    throw new Error('assertion failed: (-3.0)**2.5 should be NaN')
  }

  // (-1.5) ** 1.3 = NaN
  let r3: double = (-1.5) ** 1.3
  if (r3 == r3) {
    throw new Error('assertion failed: (-1.5)**1.3 should be NaN')
  }

  // (-0.5) ** 0.1 = NaN
  let r4: double = (-0.5) ** 0.1
  if (r4 == r4) {
    throw new Error('assertion failed: (-0.5)**0.1 should be NaN')
  }
console.log('verified')
}
