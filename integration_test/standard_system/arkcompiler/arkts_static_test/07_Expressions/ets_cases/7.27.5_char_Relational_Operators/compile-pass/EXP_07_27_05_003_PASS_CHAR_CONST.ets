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
 * @id EXP_07_27_05_003_PASS_CHAR_CONST
 * @expect compile-pass
 * @section 7.27.5
 * @design 验证 const char 常量之间关系运算编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
    const A: char = c'A';
    const Z: char = c'Z';
    const ZERO: char = c'0';

    let r1: boolean = A < Z;       // 'A'(65) < 'Z'(90) = true
    let r2: boolean = A <= A;      // 'A' <= 'A' = true
    let r3: boolean = Z > A;       // 'Z' > 'A' = true
    let r4: boolean = Z >= Z;      // 'Z' >= 'Z' = true
    let r5: boolean = ZERO < A;    // '0'(48) < 'A'(65) = true
    let r6: boolean = Z > ZERO;    // 'Z'(90) > '0'(48) = true

    console.log('PASS: ' + r1 + ' ' + r2 + ' ' + r3 + ' ' + r4);
}
