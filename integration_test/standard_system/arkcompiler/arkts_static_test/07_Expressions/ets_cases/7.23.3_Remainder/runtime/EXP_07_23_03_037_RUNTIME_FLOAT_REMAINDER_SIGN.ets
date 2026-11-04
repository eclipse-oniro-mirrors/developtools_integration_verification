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
 * @id EXP_07_23_03_037_RUNTIME_FLOAT_REMAINDER_SIGN
 * @expect runtime
 * @section 7.23.3
 * @design 验证浮点取余符号规则：结果符号与被除数相同。
 *         与 IEEE 754 remainder（Math.IEEEremainder）不同，
 *         ArkTS % 运算符如同整数取余 / C fmod 行为。
 * @note 运行时用例：验证浮点取余符号 = 被除数符号
 */
function main(): void {
  // 正数 % 正数 = 正
  let r1: double = 10.5 % 3.0
  if (r1 <= 0.0) {
    throw new Error('10.5%3.0 should be positive, got ' + r1)
  }

  // 负数 % 正数 = 负（与被除数同号）
  let r2: double = (-10.5) % 3.0
  if (r2 >= 0.0) {
    throw new Error('(-10.5)%3.0 should be negative, got ' + r2)
  }

  // 正数 % 负数 = 正（与被除数同号）
  let r3: double = 10.5 % (-3.0)
  if (r3 <= 0.0) {
    throw new Error('10.5%(-3.0) should be positive, got ' + r3)
  }

  // 负数 % 负数 = 负（与被除数同号）
  let r4: double = (-10.5) % (-3.0)
  if (r4 >= 0.0) {
    throw new Error('(-10.5)%(-3.0) should be negative, got ' + r4)
  }

  // float 类型验证
  let f1: float = Double.toFloat(10.5)
  let f2: float = Double.toFloat(3.0)
  let rf: float = f1 % f2
  if (rf <= 0) {
    throw new Error('float remainder should be positive')
  }
console.log('verified')
}
main()
