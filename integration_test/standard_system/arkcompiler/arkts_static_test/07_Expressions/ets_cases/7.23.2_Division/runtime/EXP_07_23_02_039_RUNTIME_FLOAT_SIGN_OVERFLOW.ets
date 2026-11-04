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
 * @id EXP_07_23_02_039_RUNTIME_FLOAT_SIGN_OVERFLOW
 * @expect runtime
 * @section 7.23.2
 * @design 验证 IEEE 754 浮点除法符号规则 + 溢出到 Infinity：
 *         - 同号相除结果为正
 *         - 异号相除结果为负
 *         - 浮点除法溢出到 Infinity
 * @note 运行时用例：验证除法符号规则和溢出
 */
function main(): void {
  // 符号规则：同号为正
  let r1: double = 10.0 / 2.0
  if (r1 != 5.0) {
    throw new Error('10/2 should be 5.0, got ' + r1)
  }

  // 符号规则：正/负 = 负
  let r2: double = 10.0 / (-2.0)
  if (r2 != -5.0) {
    throw new Error('10/(-2) should be -5.0, got ' + r2)
  }

  // 符号规则：负/正 = 负
  let r3: double = (-10.0) / 2.0
  if (r3 != -5.0) {
    throw new Error('(-10)/2 should be -5.0, got ' + r3)
  }

  // 符号规则：负/负 = 正
  let r4: double = (-10.0) / (-2.0)
  if (r4 != 5.0) {
    throw new Error('(-10)/(-2) should be 5.0, got ' + r4)
  }

  // 除法溢出到 Infinity：大数 / 很小正数 → Infinity
  let huge: double = 1e200
  let tiny: double = 1e-200
  let r5: double = huge / tiny
  if (r5 != 1.0 / 0.0) {
    throw new Error('1e200/1e-200 should be Inf, got ' + r5)
  }

  // 负大数 / 很小正数 → -Infinity
  let r6: double = (-huge) / tiny
  if (r6 != -1.0 / 0.0) {
    throw new Error('(-1e200)/1e-200 should be -Inf, got ' + r6)
  }
console.log('verified')
}
main()
