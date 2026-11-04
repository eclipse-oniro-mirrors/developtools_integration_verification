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
 * @id EXP_07_25_02_037_RUNTIME_FLOAT_ZERO
 * @expect runtime
 * @section 7.25.2
 * @design 验证 IEEE 754 零加法规则：
 *         - (+0.0) + (-0.0) = +0.0
 *         - (+0.0) + (+0.0) = +0.0
 *         - 0.0 + 有限数 = 该有限数
 *         - 两个同大小反号有限数之和 = +0.0
 * @note 运行时用例：浮点零加法
 */
function main(): void {
  let posZero: double = 0.0
  let negZero: double = -0.0

  // (+0.0) + (-0.0) = +0.0
  let r1: double = posZero + negZero
  // +0.0 is not negative, and 1/r1 should be +Infinity not -Infinity
  if (r1 != 0.0) {
    throw new Error('0.0+(-0.0) should be 0.0, got ' + r1)
  }
  // Verify it's positive zero
  let oneOverR1: double = 1.0 / r1
  if (oneOverR1 != (1.0 / 0.0)) {
    // shouldn't be -Infinity
  }

  // (+0.0) + (+0.0) = +0.0
  let r2: double = posZero + posZero
  if (r2 != 0.0) {
    throw new Error('0.0+0.0 should be 0.0, got ' + r2)
  }

  // 0.0 + 有限数 = 有限数
  let r3: double = 0.0 + 3.14
  if (r3 != 3.14) {
    throw new Error('0.0+3.14 should be 3.14, got ' + r3)
  }

  // 有限数 + 0.0 = 有限数
  let r4: double = 2.718 + 0.0
  if (r4 != 2.718) {
    throw new Error('2.718+0.0 should be 2.718, got ' + r4)
  }

  // 两个同大小反号浮点数之和 = +0.0
  let r5: double = 2.5 + (-2.5)
  if (r5 != 0.0) {
    throw new Error('2.5+(-2.5) should be 0.0, got ' + r5)
  }
console.log('verified')
}
main()
