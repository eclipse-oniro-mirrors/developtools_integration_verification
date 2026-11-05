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
 * @id EXP_07_22_014_PASS_BIGINT_BITWISE
 * @expect compile-pass
 * @section 7.22
 * @design 验证 bigint 位运算符 & / ^ / | 类型组合：
 *          bigint&bigint→bigint, bigint|bigint→bigint,
 *          bigint^bigint→bigint
 * @note 正向用例：bigint 位运算两个操作数都需是 bigint
 */
function main(): void {
  let a: bigint = 10n
  let b: bigint = 3n

  // bigint & bigint → bigint
  let r1 = a & b
  let r1Type = typeof(r1)
  if (r1Type != 'bigint') {
    throw new Error('bigint&bigint should be bigint, got ' + r1Type)
  }

  // bigint | bigint → bigint
  let r2 = a | b
  let r2Type = typeof(r2)
  if (r2Type != 'bigint') {
    throw new Error('bigint|bigint should be bigint, got ' + r2Type)
  }

  // bigint ^ bigint → bigint
  let r3 = a ^ b
  let r3Type = typeof(r3)
  if (r3Type != 'bigint') {
    throw new Error('bigint^bigint should be bigint, got ' + r3Type)
  }
console.log('verified')
}
main()
