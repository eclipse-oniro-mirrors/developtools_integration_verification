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
 * @id EXP_07_25_02_036_RUNTIME_FLOAT_NAN_INF
 * @expect runtime
 * @section 7.25.2
 * @design 验证 IEEE 754 NaN 和 Infinity 加法规则：
 *         - NaN + 任何数 = NaN
 *         - (+∞) + (-∞) = NaN
 *         - (+∞) + 有限数 = +∞
 *         - (-∞) + 有限数 = -∞
 * @note 运行时用例：浮点 NaN/Infinity 加法
 */
function main(): void {
  // 获取 NaN: 0.0 / 0.0
  let nanVal: double = 0.0 / 0.0
  // 获取 +Infinity: 1.0 / 0.0
  let posInf: double = 1.0 / 0.0
  // 获取 -Infinity: -1.0 / 0.0
  let negInf: double = -1.0 / 0.0

  // NaN + 任何数 = NaN
  let r1: double = nanVal + 5.0
  if (r1 == r1) {
    throw new Error('NaN + 5.0 should be NaN, but got a number')
  }

  // NaN + NaN = NaN
  let r2: double = nanVal + nanVal
  if (r2 == r2) {
    throw new Error('NaN + NaN should be NaN, but got a number')
  }

  // +Infinity + (-Infinity) = NaN
  let r3: double = posInf + negInf
  if (r3 == r3) {
    throw new Error('+Inf + (-Inf) should be NaN, got ' + r3)
  }

  // +Infinity + 有限数 = +Infinity
  let r4: double = posInf + 3.0
  if (r4 != posInf) {
    throw new Error('+Inf + 3.0 should be +Inf, got ' + r4)
  }

  // -Infinity + 有限数 = -Infinity
  let r5: double = negInf + 5.0
  if (r5 != negInf) {
    throw new Error('-Inf + 5.0 should be -Inf, got ' + r5)
  }

  // +Infinity + +Infinity = +Infinity
  let r6: double = posInf + posInf
  if (r6 != posInf) {
    throw new Error('+Inf + +Inf should be +Inf, got ' + r6)
  }
console.log('verified')
}
main()
