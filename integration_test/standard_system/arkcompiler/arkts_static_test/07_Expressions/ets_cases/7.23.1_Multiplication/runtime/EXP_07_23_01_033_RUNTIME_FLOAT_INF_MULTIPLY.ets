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
 * @id EXP_07_23_01_033_RUNTIME_FLOAT_INF_MULTIPLY
 * @expect runtime
 * @section 7.23.1
 * @design 验证 IEEE 754 Infinity * 有限数 = 有符号 Infinity：
 *         - (+Infinity) * 正数 = +Infinity
 *         - (+Infinity) * 负数 = -Infinity
 *         - (-Infinity) * 正数 = -Infinity
 *         - (-Infinity) * 负数 = +Infinity
 * @note 运行时用例：浮点无穷大乘有限数的符号规则
 */
function main(): void {
  let inf: double = 1.0 / 0.0
  let negInf: double = -1.0 / 0.0
  let posFinite: double = 3.0
  let negFinite: double = -3.0

  // +Inf * 正数 = +Inf
  let r1: double = inf * posFinite
  if (r1 != inf) {
    throw new Error('+Inf * 3.0 should be +Inf, got ' + r1)
  }

  // +Inf * 负数 = -Inf
  let r2: double = inf * negFinite
  if (r2 != negInf) {
    throw new Error('+Inf * -3.0 should be -Inf, got ' + r2)
  }

  // -Inf * 正数 = -Inf
  let r3: double = negInf * posFinite
  if (r3 != negInf) {
    throw new Error('-Inf * 3.0 should be -Inf, got ' + r3)
  }

  // -Inf * 负数 = +Inf
  let r4: double = negInf * negFinite
  if (r4 != inf) {
    throw new Error('-Inf * -3.0 should be +Inf, got ' + r4)
  }
console.log('verified')
}
main()
