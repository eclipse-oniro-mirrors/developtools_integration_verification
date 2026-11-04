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
 * @id EXP_07_27_05_002_PASS_CHAR_VARIABLES
 * @expect compile-pass
 * @section 7.27.5
 * @design 验证 let char 变量之间关系运算编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
    let a: char = c'A';
    let b: char = c'B';
    let zero: char = c'0';
    let nine: char = c'9';

    let r1: boolean = a < b;      // 'A' < 'B' = true
    let r2: boolean = a <= a;     // 'A' <= 'A' = true
    let r3: boolean = b > a;      // 'B' > 'A' = true
    let r4: boolean = a >= a;     // 'A' >= 'A' = true
    let r5: boolean = zero < nine;  // '0'(48) < '9'(57) = true
    let r6: boolean = nine > zero;  // '9'(57) > '0'(48) = true

    console.log('PASS: ' + r1 + ' ' + r2 + ' ' + r3 + ' ' + r4);
}
