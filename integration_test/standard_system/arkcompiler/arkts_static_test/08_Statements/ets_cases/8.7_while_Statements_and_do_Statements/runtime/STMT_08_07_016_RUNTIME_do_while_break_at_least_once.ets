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
 * @id STMT_08_07_016_RUNTIME_do_while_break_at_least_once
 * @expect runtime
 * @section 8.7
 * @design do-while 体内 break 提前退出，验证循环体至少执行一次 — do-while 先执行再判断条件，break 在第一次迭代即退出 — STATEMENTS.md §8.7
 * @note do-while 保证循环体至少执行一次，即使条件初始为 false 或体内有 break，首次迭代必执行
 */
function main(): void {
    // Test 1: do-while with false condition, break inside — body runs exactly once
    let count: int = 0;
    do {
        count = count + 1;
        break;
    } while (false);
    if (count != 1) {
        throw new Error("do-while(false) with break should execute body exactly once, got count=" + count);
    }

    // Test 2: do-while with break on first iteration, verify at-least-once semantics
    let visits: int = 0;
    do {
        visits = visits + 1;
        break;
    } while (true);
    if (visits != 1) {
        throw new Error("do-while(true) with break on first iteration should visit once, got visits=" + visits);
    }

    // Test 3: do-while with break after accumulating some values
    let i: int = 0;
    let sum: int = 0;
    do {
        sum = sum + i;
        i = i + 1;
        if (i >= 5) {
            break;
        }
    } while (i < 10);
    if (sum != 10) {
        throw new Error("do-while break at i>=5 should give sum=10, got sum=" + sum);
    }
    if (i != 5) {
        throw new Error("do-while break at i>=5 should leave i=5, got i=" + i);
    }

    // Test 4: do-while with condition always true, break after fixed iterations
    let iter: int = 0;
    do {
        iter = iter + 1;
        if (iter == 3) {
            break;
        }
    } while (true);
    if (iter != 3) {
        throw new Error("do-while(true) break at iter==3 should give iter=3, got iter=" + iter);
    }

    console.log("verified");
}
