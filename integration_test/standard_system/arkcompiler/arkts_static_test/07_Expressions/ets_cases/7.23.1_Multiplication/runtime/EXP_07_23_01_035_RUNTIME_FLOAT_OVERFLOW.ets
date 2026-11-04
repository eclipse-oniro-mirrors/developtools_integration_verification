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
 * @id EXP_07_23_01_035_RUNTIME_FLOAT_OVERFLOW
 * @expect runtime
 * @section 7.23.1
 * @design 验证浮点乘法溢出到 Infinity。
 *         当乘积的模过大无法表示时，结果是有符号的 Infinity。
 *         spec：The result is an appropriately signed infinity.
 * @note 运行时用例：float/double 溢出到 Infinity，不抛异常
 */
function main(): void {
  // double 最大约 1.8e308
  let huge: double = 1.0e200
  let inf: double = 1.0 / 0.0

  // 乘积超过 double 最大值 → +Infinity
  let r1: double = huge * huge
  if (r1 != inf) {
    throw new Error('1e200 * 1e200 should be Infinity, got ' + r1)
  }

  // 负数溢出 → -Infinity
  let r2: double = (-huge) * huge
  let negInf: double = -1.0 / 0.0
  if (r2 != negInf) {
    throw new Error('-1e200 * 1e200 should be -Infinity, got ' + r2)
  }

  // float 溢出：float 最大约 3.4e38
  let hugeFloat: float = Double.toFloat(1.0e20)
  let r3: float = hugeFloat * hugeFloat
  // float 取正无穷
  let floatInf: float = Double.toFloat(1.0) / Double.toFloat(0.0)
  if (r3 != floatInf) {
    throw new Error('1e20f * 1e20f should be Infinity, got ' + r3)
  }

  // 验证溢出时不抛出异常（spec 明确保证）
  // 即使有 overflow/underflow/loss of information，也不抛 error

  console.log('verified')
}
main()
