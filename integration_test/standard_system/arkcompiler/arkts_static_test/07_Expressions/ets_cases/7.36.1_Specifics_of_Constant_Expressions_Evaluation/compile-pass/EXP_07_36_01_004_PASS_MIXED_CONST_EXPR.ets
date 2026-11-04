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
 * @id EXP_07_36_01_004_PASS_MIXED_CONST_EXPR
 * @expect compile-pass
 * @section 7.36.1
 * @design 楠岃瘉娣峰悎甯搁噺琛ㄨ揪寮忥細鍚勬暟鍊煎瓙琛ㄨ揪寮忕嫭绔嬫眰鍊硷紙瀵瑰簲 spec 绀轰緥锛?
 * @note 姝ｅ悜鐢ㄤ緥锛氭贩鍚堝父閲忚〃杈惧紡 c > 1 && c*2 < 8 绛夌紪璇戦€氳繃
 */

// Spec 绀轰緥锛歝onst c = 3; c > 1 && c*2 < 8
// 鏁板€煎瓙琛ㄨ揪寮?(c > 1) 鍜?(c*2 < 8) 鐙珛姹傚€?
const c: int = 3
const result1: boolean = c > 1 && c * 2 < 8    // true && true = true
const result2: boolean = c > 5 || c * 2 < 10   // false || true = true

// 娣峰悎鏁存暟涓?double 瀛愯〃杈惧紡
const d: double = 3.0
const result3: boolean = d > 1.0 && d * 2 < 10.0

// 娣峰悎骞傝繍绠楀瓙琛ㄨ揪寮?
const exp: double = 2 ** 3 + 1   // (2**3) + 1 = 8 + 1 = 9 (double)

// 宓屽娣峰悎琛ㄨ揪寮?
const nested1: boolean = (3 + 5) > (2 * 3) && (10 - 2) == (4 + 4)
const nested2: int = (3 > 1) ? (10 + 20) : (5 * 6)

// 閫昏緫杩愮畻涓庡叧绯昏繍绠楁贩鍚?
const logic1: boolean = (3 < 5) && (10 >= 8) || (7 == 6)
const logic2: boolean = !(3 > 5) && (4 != 5)

// 浣嶈繍绠椾笌绠楁湳杩愮畻娣峰悎
const bitArith: int = (0x0F << 4) | (0x0F & 0x03)
