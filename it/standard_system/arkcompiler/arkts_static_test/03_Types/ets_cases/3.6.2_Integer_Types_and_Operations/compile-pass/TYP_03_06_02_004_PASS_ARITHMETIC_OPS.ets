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
 * @id TYP_03_06_02_004_PASS_ARITHMETIC_OPS
 * @expect compile-pass
 * @section 3.6.2
 * @design 算术运算 + - * / % 含类型推升
 * @note 正向用例：spec §3.6.2 二元运算优先 long，否则 int
 */
function testArithmeticOps(): void {
  let a: int = 100
  let b: int = 30

  let r1: int = a + b
  let r2: int = a - b
  let r3: int = a * b
  let r4: int = a / b   // 整数除法
  let r5: int = a % b

  // long + int → long
  let lo: long = 100000000000
  let r6: long = lo + a
  let r7: long = lo * a

  // byte + short → int (推升)
  let by: byte = 5
  let sh: short = 10
  let r8: int = by + sh
}