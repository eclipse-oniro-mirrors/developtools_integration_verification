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
 * @id EXP_07_23_02_036_RUNTIME_FLOAT_NAN_DIVISION
 * @expect runtime
 * @section 7.23.2
 * @design 验证 IEEE 754 浮点除法 NaN 规则：
 *         - NaN / anything = NaN
 *         - Infinity / Infinity = NaN
 *         - 0 / 0 = NaN
 *         NaN 不等于自身，因此用 x != x 检测。
 * @note 运行时用例：验证除法 NaN 产生规则
 */
function main(): void {
  let nan: double = 0.0 / 0.0
  let inf: double = 1.0 / 0.0

  // NaN / 任何数 = NaN
  let r1: double = nan / 5.0
  if (r1 == r1) {
    throw new Error('NaN/5 should be NaN')
  }

  // Infinity / Infinity = NaN
  let r2: double = inf / inf
  if (r2 == r2) {
    throw new Error('Inf/Inf should be NaN')
  }

  // 0 / 0 = NaN
  let r3: double = 0.0 / 0.0
  if (r3 == r3) {
    throw new Error('0/0 should be NaN')
  }
console.log('verified')
}
main()
