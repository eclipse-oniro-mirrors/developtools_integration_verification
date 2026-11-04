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
 * @id STMT_08_02_017_FAIL_comma_expression_outside_for
 * @expect compile-fail
 * @section 8.2
 * @design 运行时验证逗号表达式作为语句时从左到右求值，最终结果被丢弃
 * @note 验证逗号表达式语句的求值顺序、副作用保留和结果丢弃
 */

let commaAccum: int = 0;

function sideEffect(val: int): int {
    commaAccum += val;
    return commaAccum;
}

function resetCommaState(): void {
    commaAccum = 0;
}

function main(): void {
    // 测试逗号表达式语句从左到右求值
    resetCommaState();
    sideEffect(1), sideEffect(2), sideEffect(3);
    if (commaAccum != 6) {
        throw new Error("Comma expression evaluation order failed: expected commaAccum=6, got " + commaAccum);
    }

    // 测试逗号表达式与赋值的组合
    resetCommaState();
    let a: int = 0;
    a = 1, commaAccum = 10, a = 2;
    if (commaAccum != 10) {
        throw new Error("Comma expression assignment failed: expected commaAccum=10, got " + commaAccum);
    }
    if (a != 2) {
        throw new Error("Comma expression last value failed: expected a=2, got " + a);
    }

    // 测试逗号表达式最后一个子表达式值被丢弃
    resetCommaState();
    sideEffect(5), sideEffect(10);
    // 逗号表达式最终值（sideEffect(10)返回15）被丢弃
    if (commaAccum != 15) {
        throw new Error("Comma expression discard failed: expected commaAccum=15, got " + commaAccum);
    }

    // 测试长链逗号表达式
    resetCommaState();
    let b: int = 0;
    b = 10, sideEffect(1), b++, sideEffect(b), commaAccum = 100;
    if (commaAccum != 100) {
        throw new Error("Long comma chain failed: expected commaAccum=100, got " + commaAccum);
    }
    if (b != 11) {
        throw new Error("Long comma chain b increment failed: expected b=11, got " + b);
    }

    // 测试逗号表达式与增量组合
    resetCommaState();
    let c: int = 5;
    c++, commaAccum = c, c *= 2;
    if (commaAccum != 6) {
        throw new Error("Comma with increment failed: expected commaAccum=6, got " + commaAccum);
    }
    if (c != 12) {
        throw new Error("Comma with multiply failed: expected c=12, got " + c);
    }

    console.log("verified");
}
