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
 * @id EXP_07_25_02_006_PASS_BIGINT_ADD_SUB
 * @expect compile-pass
 * @section 7.25.2
 * @design 验证 bigint+bigint→bigint、bigint-bigint→bigint。
 *         spec：如果两个操作数都是 bigint，则不应用隐式转换，推断类型为 bigint。
 * @note 正向用例：bigint 加减法编译通过
 */
function main(): void {
  let a: bigint = 100000000000000n
  let b: bigint = 50000000000000n

  // bigint + bigint → bigint
  let r1 = a + b
  let t1 = typeof(r1)
  if (t1 != 'bigint') {
    throw new Error('bigint+bigint should be bigint, got ' + t1)
  }

  // bigint - bigint → bigint
  let r2 = a - b
  let t2 = typeof(r2)
  if (t2 != 'bigint') {
    throw new Error('bigint-bigint should be bigint, got ' + t2)
  }

  // bigint + bigint (负数)
  let neg: bigint = -250n
  let r3 = a + neg
  let t3 = typeof(r3)
  if (t3 != 'bigint') {
    throw new Error('bigint+(-bigint) should be bigint, got ' + t3)
  }
console.log('verified')
}
main()
