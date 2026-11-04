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
 * @id STMT_08_07_017_RUNTIME_while_zero_iterations
 * @expect runtime
 * @section 8.7
 * @design while 条件初始为 false，验证循环体执行 0 次 — while 先判断条件再执行，条件不满足则跳过整个循环体 — STATEMENTS.md §8.7
 * @note 当 while 条件表达式求值为 false 时，循环体一次也不执行，执行流直接跳到 while 之后的语句
 */
function main(): void {
    // Test 1: while with literal false — 0 iterations
    let executed: int = 0;
    while (false) {
        executed = executed + 1;
    }
    if (executed != 0) {
        throw new Error("while(false) should execute 0 times, got executed=" + executed);
    }

    // Test 2: while with comparison that is immediately false — 0 iterations
    let counter: int = 0;
    let x: int = 10;
    while (x < 5) {
        counter = counter + 1;
        x = x - 1;
    }
    if (counter != 0) {
        throw new Error("while(x<5) with x=10 should execute 0 times, got counter=" + counter);
    }
    if (x != 10) {
        throw new Error("while(x<5) with x=10 should not modify x, got x=" + x);
    }

    // Test 3: while with boolean variable set to false — 0 iterations
    let flag: boolean = false;
    let bodyExec: int = 0;
    while (flag) {
        bodyExec = bodyExec + 1;
        flag = false;
    }
    if (bodyExec != 0) {
        throw new Error("while(flag) with flag=false should execute 0 times, got bodyExec=" + bodyExec);
    }

    // Test 4: multiple zero-iteration while loops in sequence
    let hits: int = 0;
    while (false) {
        hits = hits + 1;
    }
    while (false) {
        hits = hits + 1;
    }
    while (false) {
        hits = hits + 1;
    }
    if (hits != 0) {
        throw new Error("Three while(false) in sequence should total 0 hits, got hits=" + hits);
    }

    // Test 5: control flow continues after zero-iteration while
    let after: int = 0;
    while (false) {
        after = -1;
    }
    after = 42;
    if (after != 42) {
        throw new Error("Code after while(false) should execute normally, got after=" + after);
    }

    console.log("verified");
}
