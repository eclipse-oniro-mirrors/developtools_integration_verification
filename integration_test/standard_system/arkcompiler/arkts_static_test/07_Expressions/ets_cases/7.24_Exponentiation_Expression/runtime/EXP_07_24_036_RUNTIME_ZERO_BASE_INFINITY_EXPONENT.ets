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
 * @id EXP_07_24_036_RUNTIME_ZERO_BASE_INFINITY_EXPONENT
 * @expect runtime
 * @section 7.24
 * @design 验证 +/-0 ** +/-Infinity：0**(-Inf)=+Inf, 0**(+Inf)=+0, (-0)**(-Inf)=+Inf, (-0)**(+Inf)=+0
 * @note 运行时用例：IEEE 754 +/-0 与无穷大指数
 */
function main(): void {
  let inf: double = 1.0/0.0
  let negInf: double = -1.0/0.0
  let negZero: double = -1.0/inf

  // 0**(-Inf) = +Inf
  let r1: double = 0.0 ** negInf
  if (r1 != inf) {
    throw new Error('assertion failed: 0.0**(-Inf)=' + r1)
  }

  // 0**(+Inf) = +0
  let r2: double = 0.0 ** inf
  if (r2 != 0.0) {
    throw new Error('assertion failed: 0.0**(+Inf)=' + r2)
  }

  // (-0)**(-Inf) = +Inf
  let r3: double = negZero ** negInf
  if (r3 != inf) {
    throw new Error('assertion failed: (-0)**(-Inf)=' + r3)
  }

  // (-0)**(+Inf) = +0
  let r4: double = negZero ** inf
  if (r4 != 0.0) {
    throw new Error('assertion failed: (-0)**(+Inf)=' + r4)
  }
console.log('verified')
}
