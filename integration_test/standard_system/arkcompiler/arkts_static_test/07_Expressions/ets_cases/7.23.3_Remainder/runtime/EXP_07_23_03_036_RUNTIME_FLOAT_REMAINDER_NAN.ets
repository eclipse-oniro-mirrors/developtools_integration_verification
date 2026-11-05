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
 * @id EXP_07_23_03_036_RUNTIME_FLOAT_REMAINDER_NAN
 * @expect runtime
 * @section 7.23.3
 * @design 验证浮点取余 NaN 规则。
 *         spec：结果为 NaN 的情况：
 *         - 任一操作数为 NaN
 *         - 被除数为 Infinity
 *         - 除数为零
 *         NaN 检测方式：x != x
 * @note 运行时用例：验证浮点取余 NaN 产生规则
 */
function main(): void {
  let nan: double = 0.0 / 0.0
  let inf: double = 1.0 / 0.0

  // NaN % 任何数 = NaN
  let r1: double = nan % 5.0
  if (r1 == r1) {
    throw new Error('NaN%5 should be NaN')
  }

  // Infinity % 任何数 = NaN（被除数为 Infinity）
  let r2: double = inf % 3.0
  if (r2 == r2) {
    throw new Error('Inf%3 should be NaN')
  }

  // 任何数 % 0 = NaN（除数为零）
  let r3: double = 5.0 % 0.0
  if (r3 == r3) {
    throw new Error('5%0 should be NaN (float remainder)')
  }

  // Infinity % 0 = NaN（被除数为 Infinity 且除数为零）
  let r4: double = inf % 0.0
  if (r4 == r4) {
    throw new Error('Inf%0 should be NaN')
  }
console.log('verified')
}
main()
