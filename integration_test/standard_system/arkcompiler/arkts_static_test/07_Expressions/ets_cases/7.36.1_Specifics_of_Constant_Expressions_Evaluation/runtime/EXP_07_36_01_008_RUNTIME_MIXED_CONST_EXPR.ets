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
 * @id EXP_07_36_01_008_RUNTIME_MIXED_CONST_EXPR
 * @expect runtime
 * @section 7.36.1
 * @design 楠岃瘉娣峰悎甯搁噺琛ㄨ揪寮忚繍琛屾椂琛屼负锛氬悇鏁板€煎瓙琛ㄨ揪寮忕嫭绔嬫眰鍊硷紙瀵瑰簲 spec 绀轰緥锛?
 * @note 杩愯鏃剁敤渚嬶細c > 1 && c*2 < 8 绛夋贩鍚堝父閲忚〃杈惧紡缁撴灉姝ｇ‘
 */

// Spec 绀轰緥瀵瑰簲
const c: int = 3
const specResult: boolean = c > 1 && c * 2 < 8

// 鍏朵粬娣峰悎琛ㄨ揪寮?
const r1: boolean = c > 5 || c * 2 < 10

// 涓夊厓鏉′欢甯搁噺
const r2: int = (3 > 1) ? (10 + 20) : (5 * 6)

// 閫昏緫杩愮畻娣峰悎
const r3: boolean = (3 < 5) && (10 >= 8) || (7 == 6)
const r4: boolean = !(3 > 5) && (4 != 5)

// 宓屽甯搁噺琛ㄨ揪寮?
const r5: boolean = (3 + 5) > (2 * 3) && (10 - 2) == (4 + 4)

// 浣嶈繍绠楁贩鍚?
const r6: int = (0x0F << 4) | (0x0F & 0x03)

// double 涓?int 娣峰悎
const r7: boolean = (3.0 > 1) && (2.5 * 4 < 15.0)

function main(): void {
  if (specResult != true) {
    throw new Error('assertion failed 1: c>1 && c*2<8 expected true, got false')
  }
  if (r1 != true) {
    throw new Error('assertion failed 2: c>5 || c*2<10 expected true, got false')
  }
  if (r2 != 30) {
    throw new Error('assertion failed 3: (3>1)?(10+20):(5*6) expected 30, got ' + r2)
  }
  if (r3 != true) {
    throw new Error('assertion failed 4: (3<5)&&(10>=8)||(7==6) expected true, got false')
  }
  if (r4 != true) {
    throw new Error('assertion failed 5: !(3>5)&&(4!=5) expected true, got false')
  }
  if (r5 != true) {
    throw new Error('assertion failed 6: (3+5)>(2*3)&&(10-2)==(4+4) expected true, got false')
  }
  if (r6 != 0xF3) {
    throw new Error('assertion failed 7: bit op expected 0xF3, got ' + r6)
  }
  if (r7 != true) {
    throw new Error('assertion failed 8: double/int mixed expected true, got false')
  }
console.log('verified')
}
