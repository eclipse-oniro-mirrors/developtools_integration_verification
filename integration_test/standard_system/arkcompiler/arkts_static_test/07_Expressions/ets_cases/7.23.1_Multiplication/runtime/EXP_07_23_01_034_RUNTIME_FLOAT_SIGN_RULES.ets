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
 * @id EXP_07_23_01_034_RUNTIME_FLOAT_SIGN_RULES
 * @expect runtime
 * @section 7.23.1
 * @design 验证 IEEE 754 乘法符号规则：
 *         - 同号得正（正*正=正，负*负=正）
 *         - 异号得负（正*负=负，负*正=负）
 *         spec：Positive 当两个操作数同号，Negative 当异号
 * @note 运行时用例：浮点乘法符号规则
 */
function main(): void {
  let posA: double = 2.5
  let posB: double = 3.0
  let negA: double = -2.5
  let negB: double = -3.0

  // 正 * 正 = 正
  let r1: double = posA * posB
  if (r1 <= 0.0) {
    throw new Error('2.5 * 3.0 should be positive, got ' + r1)
  }
  if (r1 != 7.5) {
    throw new Error('2.5 * 3.0 should be 7.5, got ' + r1)
  }

  // 负 * 负 = 正
  let r2: double = negA * negB
  if (r2 <= 0.0) {
    throw new Error('-2.5 * -3.0 should be positive, got ' + r2)
  }
  if (r2 != 7.5) {
    throw new Error('-2.5 * -3.0 should be 7.5, got ' + r2)
  }

  // 正 * 负 = 负
  let r3: double = posA * negB
  if (r3 >= 0.0) {
    throw new Error('2.5 * -3.0 should be negative, got ' + r3)
  }
  if (r3 != -7.5) {
    throw new Error('2.5 * -3.0 should be -7.5, got ' + r3)
  }

  // 负 * 正 = 负
  let r4: double = negA * posB
  if (r4 >= 0.0) {
    throw new Error('-2.5 * 3.0 should be negative, got ' + r4)
  }
  if (r4 != -7.5) {
    throw new Error('-2.5 * 3.0 should be -7.5, got ' + r4)
  }
console.log('verified')
}
main()
