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
 * @id EXP_07_27_01_003_PASS_NUMERIC_MIXED_INT_LONG
 * @expect compile-pass
 * @section 7.27.1
 * @design 验证int与long混合类型关系运算编译通过，转换为long后进行有符号整数比较
 * @note 正向用例：验证混合int/long关系比较编译通过
 */
function testNumericMixedIntLong(): void {
  let i: int = 1000
  let l: long = 2000

  // int < long
  let r1: boolean = i < l     // 1000 < 2000, true
  let r2: boolean = l < i     // 2000 < 1000, false

  // long < int
  let r3: boolean = i > l     // false
  let r4: boolean = l > i     // true

  // All mixed combinations
  let r5: boolean = i <= l    // true
  let r6: boolean = l <= i    // false
  let r7: boolean = i >= l    // false
  let r8: boolean = l >= i    // true

  // Negative values with mixed int/long
  let negInt: int = -500
  let negLong: long = -100
  let r9: boolean = negInt < negLong   // -500 < -100, true
  let r10: boolean = negLong < negInt  // false

  console.log(r1.toString() + r2.toString() + r3.toString() +
              r4.toString() + r5.toString() + r6.toString() +
              r7.toString() + r8.toString() + r9.toString() +
              r10.toString())
}
