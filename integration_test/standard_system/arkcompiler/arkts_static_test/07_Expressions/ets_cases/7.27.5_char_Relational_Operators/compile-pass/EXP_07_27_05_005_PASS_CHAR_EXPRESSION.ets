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
 * @id EXP_07_27_05_005_PASS_CHAR_EXPRESSION
 * @expect compile-pass
 * @section 7.27.5
 * @design 验证表达式/函数返回值作为 char 关系运算的操作数编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function getCharA(): char {
    return c'A';
}

function getCharB(): char {
    return c'B';
}

function main(): void {
    let a: char = c'A';
    let b: char = c'B';

    // 关系运算表达式作为操作数（链式）
    let r1: boolean = (a < b) == true;
    let r2: boolean = (b > a) == true;

    // 函数返回值作为操作数
    let r3: boolean = getCharA() < getCharB();  // 'A' < 'B' = true
    let r4: boolean = getCharA() <= getCharA(); // 'A' <= 'A' = true
    let r5: boolean = getCharB() > getCharA();  // 'B' > 'A' = true
    let r6: boolean = getCharB() >= getCharB(); // 'B' >= 'B' = true

    console.log('PASS: ' + r1 + ' ' + r2 + ' ' + r3 + ' ' + r4);
}
