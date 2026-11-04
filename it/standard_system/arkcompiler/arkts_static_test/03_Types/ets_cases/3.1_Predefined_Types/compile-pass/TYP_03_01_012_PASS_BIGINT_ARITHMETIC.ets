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
 * @id TYP_03_01_012_PASS_BIGINT_ARITHMETIC
 * @expect compile-pass
 * @section 3.1
 * @design bigint 字面量(n 后缀)、BigInt 别名、算术运算(+ - * / %)、一元运算(- +)、关系运算、幂运算(**)、BigInt(long/string) 构造
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testBigint(): void {
  let a: bigint = 123n
  let b: BigInt = 456n
  let c: bigint = 0n
  let d: bigint = -789n

  let sum: bigint = a + b
  let diff: bigint = a - b
  let prod: bigint = a * b
  let quot: bigint = a / b
  let rem: bigint = a % b

  let neg: bigint = -a
  let pos: bigint = +b

  let cmp1: boolean = a == b
  let cmp2: boolean = a < b
  let cmp3: boolean = a != b

  let e: bigint = a ** 2n

  let f: bigint = BigInt("12345678901234567890")
  let g: bigint = BigInt(12345 as long)
}