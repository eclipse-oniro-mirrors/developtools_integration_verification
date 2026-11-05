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
 * @id EXP_07_27_01_001_PASS_NUMERIC_INT_CMP
 * @expect compile-pass
 * @section 7.27.1
 * @design 验证int类型操作数之间的所有四种关系运算符(<, >, <=, >=)编译通过，执行有符号整数比较
 * @note 正向用例：验证int类型关系比较编译通过的正确用法
 */
function testNumericIntCmp(): void {
  let a: int = -100
  let b: int = 0
  let c: int = 100

  // int < int: signed integer comparison
  let r1: boolean = a < b    // -100 < 0, true
  let r2: boolean = a > b    // -100 > 0, false
  let r3: boolean = a <= c   // -100 <= 100, true
  let r4: boolean = a >= c   // -100 >= 100, false

  // Int boundary values
  let minInt: int = -2147483648   // (approximate int min)
  let maxInt: int = 2147483647    // (approximate int max)
  let r5: boolean = minInt < maxInt
  let r6: boolean = maxInt > 0
  let r7: boolean = minInt <= 0
  let r8: boolean = maxInt >= 0

  console.log(r1.toString() + r2.toString() + r3.toString() +
              r4.toString() + r5.toString() + r6.toString() +
              r7.toString() + r8.toString())
}
