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
 * @id EXP_07_23_01_005_PASS_BIGINT_MULTIPLICATION
 * @expect compile-pass
 * @section 7.23.1
 * @design 验证 bigint 乘法 bigint*bigint→bigint。
 *         bigint 类型要求两个操作数都为 bigint。
 * @note 正向用例：验证 bigint 乘法编译通过且结果类型为 bigint
 */
function main(): void {
  let a: bigint = 100n
  let b: bigint = 200n

  // bigint * bigint → bigint
  let r1 = a * b
  let r1Type = typeof(r1)
  if (r1Type != 'bigint') {
    throw new Error('bigint*bigint should be bigint, got ' + r1Type)
  }

  // 大整数乘法
  let c: bigint = 1000000000000n
  let r2 = a * c
  let r2Type = typeof(r2)
  if (r2Type != 'bigint') {
    throw new Error('bigint*bigint large should be bigint, got ' + r2Type)
  }

  // 零 bigint 乘法
  let d: bigint = 0n
  let r3 = a * d
  if (r3 != 0n) {
    throw new Error('bigint * 0n should be 0n, got ' + r3)
  }
console.log('verified')
}
main()
