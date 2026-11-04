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
 * @id STMT_08_15_2_014_PASS_finally_loop_break_continue
 * @expect compile-pass
 * @section 8.15.2
 * @design 测试finally块在循环中与break和continue组合：验证finally子句在循环作用域中使用break/continue是合法的语法结构。finally块在break或continue跳转前保证执行。
 * @note 正向测试：循环内finally+break/continue为合法语法，代码应正确编译通过
 */
function testFinallyLoopBreak(): void {
    let i: number = 0;
    while (i < 5) {
        try {
            if (i == 3) {
                break;
            }
        } finally {
            i = i + 1;
        }
    }
    if (i != 4) {
        console.log("unexpected i: " + i);
    }
}

function testFinallyLoopContinue(): void {
    let sum: number = 0;
    let j: number = 0;
    while (j < 5) {
        try {
            j = j + 1;
            if (j == 2) {
                continue;
            }
            sum = sum + j;
        } finally {
            // finally executes on each iteration including continue
            sum = sum;
        }
    }
    if (sum != 13) { // 1 + 3 + 4 + 5 = 13 (skip 2)
        console.log("unexpected sum: " + sum);
    }
}

function testFinallyLoopBreakInner(): void {
    // break from inner try-finally inside loop
    let k: number = 0;
    while (k < 10) {
        k = k + 1;
        try {
            if (k == 5) {
                break;
            }
        } finally {
            let dummy: number = k;
        }
    }
}
