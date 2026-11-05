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
 * @id EXP_07_27_02_003_PASS_BIGINT_DOUBLE_CMP
 * @expect compile-pass
 * @section 7.27.2
 * @design 验证bigint与double混合类型关系运算编译通过：bigint转换为double，然后执行浮点比较
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function testBigintDoubleCmp(): void {
  let bi: bigint = 1000n
  let d1: double = 500.0
  let d2: double = 1500.0
  let d3: double = 1000.0

  // bigint < double  (bigint -> double, then floating-point comparison)
  let r1: boolean = bi < d1     // 1000.0 < 500.0, false
  let r2: boolean = bi < d2     // 1000.0 < 1500.0, true

  // bigint > double
  let r3: boolean = bi > d1     // true
  let r4: boolean = bi > d2     // false

  // bigint <= double (equal value)
  let r5: boolean = bi <= d3    // 1000.0 <= 1000.0, true
  let r6: boolean = bi >= d3    // 1000.0 >= 1000.0, true

  // double < bigint
  let r7: boolean = d1 < bi     // 500.0 < 1000.0, true
  let r8: boolean = d2 < bi     // 1500.0 < 1000.0, false

  console.log(r1.toString() + r2.toString() + r3.toString() +
              r4.toString() + r5.toString() + r6.toString() +
              r7.toString() + r8.toString())
}
