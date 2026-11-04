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
 * @id EXP_07_23_02_040_RUNTIME_NEVER_THROWS
 * @expect runtime
 * @section 7.23.2
 * @design 验证除法运算从不抛异常（除零和 bigint 除零除外）。
 *         spec：The evaluation of a floating-point division operator '/'
 *         never throws an error despite possible overflow, underflow,
 *         division by zero, or loss of information.
 *         整数除零已在专用用例中验证抛异常，此处验证其他极端情况不抛异常。
 * @note 运行时用例：各种极端场景除法不抛异常（浮点除零不抛）
 */
function main(): void {
  // 1. 浮点除零不抛异常（产生 Infinity）
  let r1: double = 5.0 / 0.0
  if (r1 != 1.0 / 0.0) {
    throw new Error('5.0/0.0 should be Inf (not throw)')
  }

  // 2. 浮点 0/0 不抛异常（产生 NaN）
  let r2: double = 0.0 / 0.0
  // NaN 不等于自身，不会抛异常

  // 3. 浮点 Inf/Inf 不抛异常（产生 NaN）
  let inf: double = 1.0 / 0.0
  let r3: double = inf / inf

  // 4. 大数除法溢出不抛异常
  let huge: double = 1e200
  let tiny: double = 1e-200
  let r4: double = huge / tiny
  // Infinity，不抛异常

  // 5. 浮点下溢不抛异常（很小的数相除 → 0 或 subnormal）
  let r5: double = tiny / huge
  // 0 或 subnormal，不抛异常

  // 6. 精度丢失不抛异常
  let r6: double = 1.0 / 3.0
  // 0.333...，精度有限，不抛异常

  // 7. 整数 INT_MIN / -1 溢出不抛异常
  let minInt: int = -2147483647 - 1
  let r7: int = minInt / (-1)

  console.log('verified')
}
main()
