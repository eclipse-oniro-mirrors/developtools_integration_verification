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
 * @id EXP_07_27_03_002_PASS_STRING_LEXICOGRAPHIC
 * @expect compile-pass
 * @section 7.27.3
 * @design 验证字符串字典序比较的正确行为：逐字符比较Unicode码点，短字符串是长字符串前缀时短字符串较小
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function testStringLexicographic(): void {
  // Lexicographic ordering examples
  let r1: boolean = 'a' < 'b'          // single char: 'a'(97) < 'b'(98), true
  let r2: boolean = 'A' < 'a'          // 'A'(65) < 'a'(97), true
  let r3: boolean = '0' < '9'          // '0'(48) < '9'(57), true
  let r4: boolean = 'ab' < 'ac'        // second char: 'b'(98) < 'c'(99), true
  let r5: boolean = 'abc' < 'abd'      // third char differs, true

  // Prefix case: shorter string < longer string when prefix matches
  let r6: boolean = 'ab' < 'abc'       // 'ab' is prefix of 'abc', true
  let r7: boolean = 'abc' < 'ab'       // 'abc' is not less than prefix, false

  // Empty string as prefix
  let r8: boolean = '' < 'a'           // empty string < any non-empty, true
  let r9: boolean = 'a' < ''           // false

  // Case sensitivity
  let r10: boolean = 'Hello' < 'hello'  // 'H'(72) < 'h'(104), true

  // Numbers as strings: lexicographic, not numeric
  let r11: boolean = '100' < '20'       // '1'(49) < '2'(50), true (not numeric!)
  let r12: boolean = '2' < '10'         // '2'(50) > '1'(49), false

  console.log(r1.toString() + r2.toString() + r3.toString() +
              r4.toString() + r5.toString() + r6.toString() +
              r7.toString() + r8.toString() + r9.toString() +
              r10.toString() + r11.toString() + r12.toString())
}
