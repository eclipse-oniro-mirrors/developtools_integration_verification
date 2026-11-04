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
 * @id EXP_07_27_04_024_RUNTIME_EDGE
 * @expect runtime
 * @section 7.27.4
 * @design 验证函数返回值、条件表达式结果作为 boolean 关系操作数运行时行为
 * @note 运行时用例：函数返回值、三元表达式等作为 boolean 关系操作数
 */
function isPositive(x: int): boolean {
    return x > 0;
}

function isNegative(x: int): boolean {
    return x < 0;
}

function main(): void {
    // 函数返回值作为操作数
    if ((isPositive(5) < isPositive(-3)) != false) { throw new Error('assertion failed: isPositive(5) < isPositive(-3)'); }
    if ((isNegative(5) < isPositive(5)) != true) { throw new Error('assertion failed: isNegative(5) < isPositive(5) [false < true]'); }
    if ((isPositive(0) > isNegative(0)) != false) { throw new Error('assertion failed: isPositive(0) > isNegative(0)'); }
    if ((isPositive(5) <= isPositive(10)) != true) { throw new Error('assertion failed: isPositive(5) <= isPositive(10)'); }

    // 三元表达式结果作为操作数
    let a: boolean = (5 > 3) ? true : false;    // true
    let b: boolean = (3 > 5) ? true : false;    // false
    if ((b < a) != true) { throw new Error('assertion failed: ternary b < a'); }
    if ((a <= a) != true) { throw new Error('assertion failed: ternary a <= a'); }
    if ((a > b) != true) { throw new Error('assertion failed: ternary a > b'); }
    if ((b >= b) != true) { throw new Error('assertion failed: ternary b >= b'); }
console.log('verified');
}
