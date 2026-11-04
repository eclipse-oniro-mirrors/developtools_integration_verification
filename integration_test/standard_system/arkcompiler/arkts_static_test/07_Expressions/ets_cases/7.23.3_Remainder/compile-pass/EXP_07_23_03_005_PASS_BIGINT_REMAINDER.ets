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
 * @id EXP_07_23_03_005_PASS_BIGINT_REMAINDER
 * @expect compile-pass
 * @section 7.23.3
 * @design 验证 bigint/bigint→bigint 取余编译通过。
 *         bigint 取余要求两个操作数都是 bigint。
 *         spec：(a/b)*b + (a%b) == a 恒等式对 bigint 成立。
 * @note 正向用例：验证 bigint 取余编译通过
 */
function main(): void {
  let a: bigint = 100n
  let b: bigint = 3n

  // bigint % bigint → bigint
  let r1 = a % b
  let r1Type = typeof(r1)
  if (r1Type != 'bigint') {
    throw new Error('bigint%bigint should be bigint, got ' + r1Type)
  }

  // 大数 bigint 取余
  let c: bigint = 999999999999999999999999999999n
  let d: bigint = 123456789n
  let r2 = c % d
  let r2Type = typeof(r2)
  if (r2Type != 'bigint') {
    throw new Error('bigint remainder type should be bigint, got ' + r2Type)
  }
console.log('verified')
}
main()
