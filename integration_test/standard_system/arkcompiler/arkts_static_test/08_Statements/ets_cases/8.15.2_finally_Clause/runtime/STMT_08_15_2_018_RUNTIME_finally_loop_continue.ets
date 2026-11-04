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
 * @id STMT_08_15_2_018_RUNTIME_finally_loop_continue
 * @expect runtime
 * @section 8.15.2
 * @design 运行时验证循环内finally子句在continue时的执行：finally块在continue将控制权转移到下一次迭代之前保证执行。通过计数器验证每次迭代的finally都被调用，包括触发continue的迭代。
 * @note 运行时测试：验证循环内continue时finally仍执行
 */
function main(): void {
    // Test: finally executes on every iteration including those with continue
    let finallyCount: number = 0;
    let continueReached: boolean = false;
    let i: number = 0;
    while (i < 10) {
        i = i + 1;
        try {
            if (i == 3 || i == 7) {
                continueReached = true;
                continue;
            }
        } finally {
            finallyCount = finallyCount + 1;
        }
    }
    if (finallyCount != 10) {
        throw new Error("FAIL: finally should execute on all 10 iterations, got " + finallyCount);
    }
    if (continueReached != true) {
        throw new Error("FAIL: continue was never reached");
    }

    // Test: finally executes before continue skips to next iteration
    let tracker: string = "";
    let k: number = 0;
    while (k < 4) {
        k = k + 1;
        try {
            tracker = tracker + "t" + k;
            if (k == 2) {
                continue;
            }
            tracker = tracker + "a" + k;
        } finally {
            tracker = tracker + "f" + k;
        }
    }
    // Expected: t1a1f1 t2f2 t3a3f3 t4a4f4
    // Note: after continue on k=2, "a2" is skipped but "f2" runs
    if (tracker != "t1a1f1t2f2t3a3f3t4a4f4") {
        throw new Error("FAIL: unexpected tracker sequence: " + tracker);
    }

    console.log("verified");
}
