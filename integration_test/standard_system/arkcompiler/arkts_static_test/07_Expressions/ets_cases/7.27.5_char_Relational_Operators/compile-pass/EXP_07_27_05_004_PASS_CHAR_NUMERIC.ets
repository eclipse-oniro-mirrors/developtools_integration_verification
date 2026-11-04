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
 * @id EXP_07_27_05_004_PASS_CHAR_NUMERIC
 * @expect compile-pass
 * @section 7.27.5
 * @design 验证 char 与数值类型 byte/int/long/double 关系运算编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 *       char → int（另一操作数为 byte/char/int 时）
 *       char → other numeric type（另一操作数为 short/long/float/double 时）
 */
function main(): void {
    let c: char = c'A';  // 65
    let i: int = 66;
    let b: byte = 65;
    let l: long = 65;
    let d: double = 65.0;

    // char vs int
    let r1: boolean = c < i;     // 65 < 66 = true
    let r2: boolean = c <= 65;   // 65 <= 65 = true

    // char vs byte
    let r3: boolean = c <= b;    // 65 <= 65 = true

    // char vs long
    let r4: boolean = c < l;     // 65 < 65 = false
    let r5: boolean = c >= l;    // 65 >= 65 = true

    // char vs double
    let r6: boolean = c > d;     // 65 > 65.0 = false
    let r7: boolean = c >= 65.0; // 65 >= 65.0 = true

    // 数值类型操作数在左侧
    let r8: boolean = 66 > c;    // 66 > 65 = true
    let r9: boolean = 65 <= c;   // 65 <= 65 = true
    let r10: boolean = 65.0 <= c;// 65.0 <= 65 = true

    console.log('PASS: ' + r1 + ' ' + r2 + ' ' + r3 + ' ' + r4);
}
