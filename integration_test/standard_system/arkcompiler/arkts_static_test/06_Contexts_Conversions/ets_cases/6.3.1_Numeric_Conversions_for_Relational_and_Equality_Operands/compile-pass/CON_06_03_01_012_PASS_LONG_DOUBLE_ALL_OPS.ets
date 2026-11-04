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
 * @id CON_06_03_01_012_PASS_LONG_DOUBLE_ALL_OPS
 * @expect compile-pass
 * @section 6.3.1
 * @design 所有关系/相等运算符: long 与 double 的 < > <= >= == !=
 * @note 正向用例：验证全部六种运算符在 widening 上下文中编译通过
 */
function testLongDoubleAllOps(): void {
  let a: long = 100
  let b: double = 99.5
  let r1: boolean = a < b
  let r2: boolean = a > b
  let r3: boolean = a <= b
  let r4: boolean = a >= b
  let r5: boolean = a == b
  let r6: boolean = a != b
}
