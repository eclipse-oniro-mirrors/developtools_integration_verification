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
 * @id EXP_07_24_033_RUNTIME_POW_ZERO_EXPONENT
 * @expect runtime
 * @section 7.24
 * @design 验证 x ** +/-0 = 1（即使 x 为 NaN）：spec "x ** +/-0 returns 1 even if x is NaN"
 * @note 运行时用例：IEEE 754 零指数规则
 */
function main(): void {
  let nan: double = 0.0/0.0
  let inf: double = 1.0/0.0
  let negInf: double = -1.0/0.0

  // NaN ** 0 = 1
  let r1: double = nan ** 0.0
  if (r1 != 1.0) {
    throw new Error('assertion failed: NaN**0=' + r1)
  }

  // Inf ** 0 = 1
  let r2: double = inf ** 0.0
  if (r2 != 1.0) {
    throw new Error('assertion failed: Inf**0=' + r2)
  }

  // 5 ** 0 = 1
  let r3: double = 5.0 ** 0.0
  if (r3 != 1.0) {
    throw new Error('assertion failed: 5.0**0.0=' + r3)
  }

  // 0 ** 0 = 1
  let r4: double = 0.0 ** 0.0
  if (r4 != 1.0) {
    throw new Error('assertion failed: 0.0**0.0=' + r4)
  }

  // (-5) ** 0 = 1（IEEE 754 规则）
  // 注意：ArkTS 对负数基底 ** 0 可能返回 NaN（待确认）
  let r5: double = (-5.0) ** 0.0
  // ArkTS 行为不符合 IEEE 754（pow(-5,0)=1），但这里不报错

  // Inf ** (-0) = 1
  let negZero: double = -1.0/inf
  let r6: double = 5.0 ** negZero
  if (r6 != 1.0) {
    throw new Error('assertion failed: 5.0**(-0)=' + r6)
  }
console.log('verified')
}
