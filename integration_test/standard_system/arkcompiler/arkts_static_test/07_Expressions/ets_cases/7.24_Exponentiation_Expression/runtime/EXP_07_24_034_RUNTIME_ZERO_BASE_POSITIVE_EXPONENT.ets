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
 * @id EXP_07_24_034_RUNTIME_ZERO_BASE_POSITIVE_EXPONENT
 * @expect runtime
 * @section 7.24
 * @design 验证 +/-0 ** y 有符号零和 Infinity 规则：正奇整数→+0, 正偶整数→+0, 负奇整数→-Infinity, 负偶整数→+Infinity
 * @note 运行时用例：IEEE 754 零基底规则
 */
function main(): void {
  let inf: double = 1.0/0.0
  let negZero: double = -1.0/inf

  // 0**3 = +0（正奇整数）
  let r1: double = 0.0 ** 3.0
  if (r1 != 0.0) {
    throw new Error('assertion failed: 0.0**3.0=' + r1)
  }

  // 0**2 = +0（正偶整数）
  let r2: double = 0.0 ** 2.0
  if (r2 != 0.0) {
    throw new Error('assertion failed: 0.0**2.0=' + r2)
  }

  // (-0)**3 = -0（负奇整数），通过 1.0/(-0) = -Infinity 检测
  let r3: double = negZero ** 3.0
  if (1.0/r3 != -inf) {
    throw new Error('assertion failed: (-0)**3.0 should be -0')
  }

  // (-0)**2 = +0（负偶整数）
  let r4: double = negZero ** 2.0
  if (r4 != 0.0) {
    throw new Error('assertion failed: (-0)**2.0=' + r4)
  }
  // 确认是 +0 不是 -0
  if (1.0/r4 != inf) {
    throw new Error('assertion failed: (-0)**2.0 should be +0')
  }
console.log('verified')
}
