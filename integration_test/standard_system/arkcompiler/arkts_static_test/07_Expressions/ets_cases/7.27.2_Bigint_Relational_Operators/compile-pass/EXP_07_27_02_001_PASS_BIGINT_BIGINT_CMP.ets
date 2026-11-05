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
 * @id EXP_07_27_02_001_PASS_BIGINT_BIGINT_CMP
 * @expect compile-pass
 * @section 7.27.2
 * @design 验证两个bigint类型操作数之间的关系运算符编译通过，执行bigint有符号比较
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function testBigintBigintCmp(): void {
  let a: bigint = 100n
  let b: bigint = 200n
  let c: bigint = 100n

  // bigint < bigint
  let r1: boolean = a < b     // 100n < 200n, true
  let r2: boolean = b < a     // 200n < 100n, false

  // bigint > bigint
  let r3: boolean = a > b     // false
  let r4: boolean = b > a     // true

  // bigint <= bigint
  let r5: boolean = a <= c    // 100n <= 100n, true (equal)
  let r6: boolean = a <= b    // 100n <= 200n, true

  // bigint >= bigint
  let r7: boolean = a >= c    // 100n >= 100n, true (equal)
  let r8: boolean = a >= b    // 100n >= 200n, false

  // Negative bigint
  let negBig: bigint = -50n
  let posBig: bigint = 50n
  let r9: boolean = negBig < posBig     // true
  let r10: boolean = negBig > posBig    // false

  console.log(r1.toString() + r2.toString() + r3.toString() +
              r4.toString() + r5.toString() + r6.toString() +
              r7.toString() + r8.toString() + r9.toString() +
              r10.toString())
}
