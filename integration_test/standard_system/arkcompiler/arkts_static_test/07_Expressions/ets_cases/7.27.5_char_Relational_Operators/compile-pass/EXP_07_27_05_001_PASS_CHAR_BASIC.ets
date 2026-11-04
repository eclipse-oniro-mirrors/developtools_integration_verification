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
 * @id EXP_07_27_05_001_PASS_CHAR_BASIC
 * @expect compile-pass
 * @section 7.27.5
 * @design 验证 char 四个关系运算符在文字量上编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 *       char 文字量比较基于 unsigned 16-bit 数值语义
 */
function main(): void {
    // char 关系运算符基本用法
    let r1: boolean = c'A' < c'B';   // 'A'(65) < 'B'(66) = true
    let r2: boolean = c'A' <= c'A';  // 'A'(65) <= 'A'(65) = true
    let r3: boolean = c'B' > c'A';   // 'B'(66) > 'A'(65) = true
    let r4: boolean = c'A' >= c'A';  // 'A'(65) >= 'A'(65) = true

    // 默认值（NUL）
    let r5: boolean = c'\x00' < c'A';   // 0 < 65 = true
    let r6: boolean = c'\x00' <= c'\x00'; // 0 <= 0 = true
    let r7: boolean = c'￿' > c'\x00';  // 65535 > 0 = true
    let r8: boolean = c'￿' >= c'￾'; // 65535 >= 65534 = true

    console.log('PASS: ' + r1 + ' ' + r2 + ' ' + r3 + ' ' + r4);
}
