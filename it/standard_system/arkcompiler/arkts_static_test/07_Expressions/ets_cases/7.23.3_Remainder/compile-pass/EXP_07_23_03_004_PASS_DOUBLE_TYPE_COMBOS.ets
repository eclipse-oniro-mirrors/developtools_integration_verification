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
 * @id EXP_07_23_03_004_PASS_DOUBLE_TYPE_COMBOS
 * @expect compile-pass
 * @section 7.23.3
 * @design 验证 double 取余类型组合：
 *         double/int→number，double/float→number，double/double→number
 *         typeof(double) 返回 "number"（ECMAScript 兼容）
 * @note 正向用例：验证 double 取余结果类型为 "number"
 */
function main(): void {
  let a: double = 10.5
  let b: int = 3
  let c: float = Double.toFloat(2.5)
  let d: double = 4.0

  // double % int → number
  let r1 = a % b
  let r1Type = typeof(r1)
  if (r1Type != 'number') {
    throw new Error('double%int should be number, got ' + r1Type)
  }

  // double % float → number
  let r2 = a % c
  let r2Type = typeof(r2)
  if (r2Type != 'number') {
    throw new Error('double%float should be number, got ' + r2Type)
  }

  // double % double → number
  let r3 = a % d
  let r3Type = typeof(r3)
  if (r3Type != 'number') {
    throw new Error('double%double should be number, got ' + r3Type)
  }

  // int % double → number
  let r4 = b % a
  let r4Type = typeof(r4)
  if (r4Type != 'number') {
    throw new Error('int%double should be number, got ' + r4Type)
  }
console.log('verified')
}
main()
