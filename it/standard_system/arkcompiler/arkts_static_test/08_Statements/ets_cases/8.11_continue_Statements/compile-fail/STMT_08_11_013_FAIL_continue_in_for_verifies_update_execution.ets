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
 * @id STMT_08_11_013_FAIL_continue_in_for_verifies_update_execution
 * @expect compile-fail
 * @section 8.11
 * @design 验证for循环中continue语句触发后，forUpdate表达式在条件重新评估前被执行
 * @note runtime test: per spec, continue in for must execute forUpdate before forContinue (condition check). The update counter must increment even on continue iterations.
 */
function main(): void {
    let updateCount: number = 0;
    let bodyCount: number = 0;
    let i: number = 0;

    // for loop with compound update: continue should still execute the update
    for (i = 0; i < 5; (updateCount++, i++)) {
        bodyCount++;
        if (i == 2) {
            continue; // must execute (updateCount++, i++) before checking i < 5
        }
    }

    // Trace:
    // i=0: bodyCount=1, no continue, updateCount=1, i=1 → cond 1<5 true
    // i=1: bodyCount=2, no continue, updateCount=2, i=2 → cond 2<5 true
    // i=2: bodyCount=3, CONTINUE,   updateCount=3, i=3 → cond 3<5 true
    // i=3: bodyCount=4, no continue, updateCount=4, i=4 → cond 4<5 true
    // i=4: bodyCount=5, no continue, updateCount=5, i=5 → cond 5<5 false → exit
    // Expected: bodyCount=5, updateCount=5
    if (bodyCount != 5 || updateCount != 5) {
        throw new Error(
            "continue in for did not execute update expression: bodyCount=" +
            bodyCount + " updateCount=" + updateCount
        );
    }
    console.log("verified");
}
