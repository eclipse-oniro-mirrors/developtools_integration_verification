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
 * @id STMT_08_15_2_017_RUNTIME_finally_loop_break
 * @expect runtime
 * @section 8.15.2
 * @design 运行时验证循环内finally子句在break时的执行：finally块在break将控制权转移出循环之前保证执行。通过计数器追踪finally执行次数和break是否按预期触发。
 * @note 运行时测试：验证循环内break时finally仍执行
 */
function main(): void {
    // Test: finally executes before break exits the loop
    let finallyCount: number = 0;
    let breakReached: boolean = false;
    let i: number = 0;
    while (i < 10) {
        i = i + 1;
        try {
            if (i == 5) {
                breakReached = true;
                break;
            }
        } finally {
            finallyCount = finallyCount + 1;
        }
    }
    if (finallyCount != 5) {
        throw new Error("FAIL: finally should execute 5 times (iterations 1-5), got " + finallyCount);
    }
    if (breakReached != true) {
        throw new Error("FAIL: break was not reached");
    }
    if (i != 5) {
        throw new Error("FAIL: loop counter should be 5 at break, got " + i);
    }

    // Test: break from inner try-finally exits outer loop correctly
    let outerCount: number = 0;
    let innerFinallyCount: number = 0;
    let j: number = 0;
    while (j < 10) {
        j = j + 1;
        outerCount = outerCount + 1;
        try {
            if (j >= 3) {
                break;
            }
        } finally {
            innerFinallyCount = innerFinallyCount + 1;
        }
    }
    if (innerFinallyCount != 3) {
        throw new Error("FAIL: inner finally should execute 3 times before break, got " + innerFinallyCount);
    }
    if (outerCount != 3) {
        throw new Error("FAIL: outer loop should iterate 3 times, got " + outerCount);
    }

    console.log("verified");
}
