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
 * @id EXP_07_36_01_007_RUNTIME_TYPE_PROMOTION
 * @expect runtime
 * @section 7.36.1
 * @design 楠岃瘉 double/float 绫诲瀷鎻愬崌鍙婂箓杩愮畻鍦ㄥ父閲忚〃杈惧紡涓殑杩愯鏃剁粨鏋?
 * @note 杩愯鏃剁敤渚嬶細double+int 鎻愬崌涓?double 鍊兼纭紝骞傝繍绠楃粨鏋滀负 double 鍊兼纭?
 */

// double 鎻愬崌甯搁噺
const d1: double = 3.0 + 5       // double + int 鈫?double: 8.0
const d2: double = 10.5 - 3      // double - int 鈫?double: 7.5
const d3: double = 2.5 * 4       // double * int 鈫?double: 10.0
const d4: double = 10.0 / 3      // double / int 鈫?double: ~3.333...
const d5: double = 1.0 + 2 + 3   // double + int + int 鈫?double: 6.0

// 骞傝繍绠楀父閲忥細濮嬬粓涓?double
const e1: double = 2 ** 3        // int ** int 鈫?double: 8.0
const e2: double = 5 ** 0        // int ** int 鈫?double: 1.0
const e3: double = 2.0 ** 3      // double ** int 鈫?double: 8.0
const e4: double = 2 ** 3.0      // int ** double 鈫?double: 8.0

function main(): void {
  if (d1 != 8.0) {
    throw new Error('assertion failed 1: 3.0+5 expected 8.0, got ' + d1)
  }
  if (d2 != 7.5) {
    throw new Error('assertion failed 2: 10.5-3 expected 7.5, got ' + d2)
  }
  if (d3 != 10.0) {
    throw new Error('assertion failed 3: 2.5*4 expected 10.0, got ' + d3)
  }
  // d4: 10.0/3 = 3.333..., use tolerance
  if (d4 < 3.33 || d4 > 3.34) {
    throw new Error('assertion failed 4: 10.0/3 expected ~3.333, got ' + d4)
  }
  if (d5 != 6.0) {
    throw new Error('assertion failed 5: 1.0+2+3 expected 6.0, got ' + d5)
  }

  // 骞傝繍绠楅獙璇?
  if (e1 != 8.0) {
    throw new Error('assertion failed 6: 2**3 expected 8.0, got ' + e1)
  }
  if (e2 != 1.0) {
    throw new Error('assertion failed 7: 5**0 expected 1.0, got ' + e2)
  }
  if (e3 != 8.0) {
    throw new Error('assertion failed 8: 2.0**3 expected 8.0, got ' + e3)
  }
  if (e4 != 8.0) {
    throw new Error('assertion failed 9: 2**3.0 expected 8.0, got ' + e4)
  }
console.log('verified')
}
