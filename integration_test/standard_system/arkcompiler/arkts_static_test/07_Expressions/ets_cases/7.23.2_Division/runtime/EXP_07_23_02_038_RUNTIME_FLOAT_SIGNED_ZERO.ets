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
 * @id EXP_07_23_02_038_RUNTIME_FLOAT_SIGNED_ZERO
 * @expect runtime
 * @section 7.23.2
 * @design 验证 IEEE 754 浮点除法有符号零规则：
 *         - Finite / Infinity = signed 0
 *         - 0 / finite = signed 0
 *         有符号零：+0 和 -0，1/(+0)=+Inf，1/(-0)=-Inf
 * @note 运行时用例：验证除法有符号零产生规则
 */
function main(): void {
  let inf: double = 1.0 / 0.0

  // Finite / Infinity = signed 0
  let r1: double = 3.0 / inf
  // +0，检测方式：1/r1 应该等于 +Inf
  let check1: double = 1.0 / r1
  if (check1 != 1.0 / 0.0) {
    throw new Error('3/Inf should be +0')
  }

  // Negative finite / Infinity = signed -0
  let r2: double = (-3.0) / inf
  let check2: double = 1.0 / r2
  if (check2 != -1.0 / 0.0) {
    throw new Error('(-3)/Inf should be -0')
  }

  // 0 / finite = signed 0（正 0）
  let r3: double = 0.0 / 3.0
  let check3: double = 1.0 / r3
  if (check3 != 1.0 / 0.0) {
    throw new Error('0/3 should be +0')
  }
console.log('verified')
}
main()
