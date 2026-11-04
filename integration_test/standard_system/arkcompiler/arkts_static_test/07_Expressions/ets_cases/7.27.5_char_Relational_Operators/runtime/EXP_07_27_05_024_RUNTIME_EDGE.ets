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
 * @id EXP_07_27_05_024_RUNTIME_EDGE
 * @expect runtime
 * @section 7.27.5
 * @design 验证 char 在变量、函数返回值、三元表达式等场景中的关系运算
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function getCharA(): char {
    return c'A';
}

function getCharB(): char {
    return c'B';
}

function main(): void {
    // let 变量比较
    let a: char = c'A';
    let b: char = c'B';
    if ((a < b) != true) { throw new Error('FAIL: let var 'A' < 'B' should be true'); }
    if ((b > a) != true) { throw new Error('FAIL: let var 'B' > 'A' should be true'); }

    // const 常量比较
    const capA: char = c'A';
    const capZ: char = c'Z';
    if ((capA < capZ) != true) { throw new Error('FAIL: const 'A' < 'Z' should be true'); }
    if ((capZ > capA) != true) { throw new Error('FAIL: const 'Z' > 'A' should be true'); }

    // 函数返回值比较
    if ((getCharA() < getCharB()) != true) { throw new Error('FAIL: func 'A' < 'B' should be true'); }
    if ((getCharB() > getCharA()) != true) { throw new Error('FAIL: func 'B' > 'A' should be true'); }

    // char 与数值类型在复合表达式中混合使用
    let zero: char = c'0';
    let one: char = c'1';
    if ((zero < one && one > zero) != true) { throw new Error('FAIL: '0' < '1' && '1' > '0' should be true'); }
    if ((zero >= one || zero <= one) != true) { throw new Error('FAIL: '0' >= '1' || '0' <= '1' should be true'); }
console.log('verified');
}
