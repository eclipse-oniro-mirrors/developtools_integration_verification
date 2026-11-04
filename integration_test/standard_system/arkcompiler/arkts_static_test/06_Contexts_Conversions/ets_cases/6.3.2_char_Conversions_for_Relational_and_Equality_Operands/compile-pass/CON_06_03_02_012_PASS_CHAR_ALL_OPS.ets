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
 * @id CON_06_03_02_012_PASS_CHAR_ALL_OPS
 * @expect compile-pass
 * @section 6.3.2
 * @design char 与全部数值类型的全部六种关系/相等运算符
 * @note 正向用例：验证 char 的全面 widening 比较编译通过
 */
function testCharAllOps(c: char, b: byte, i: int, l: long, d: double): void {
  let r1: boolean = c < b
  let r2: boolean = c < i
  let r3: boolean = c < l
  let r4: boolean = c < d
  let r5: boolean = c > b
  let r6: boolean = c > i
  let r7: boolean = c > l
  let r8: boolean = c > d
  let r9: boolean = c <= b
  let r10: boolean = c >= i
  let r11: boolean = c == l
  let r12: boolean = c != d
}
