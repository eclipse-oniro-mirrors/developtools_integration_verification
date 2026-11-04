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
 * @id STMT_08_10_013_RUNTIME_break_deep_nested_labeled_outer
 * @expect runtime
 * @section 8.10
 * @design 验证三层嵌套循环中带标签break直接跳出最外层标记的循环，中层和内层都被终止
 * @note Verify labeled break from 3-level deep loop exits directly to outer, mid and inner both stop
 */
function main(): void {
    let i: int = 0;
    let j: int = 0;
    let k: int = 0;
    let outerRuns: int = 0;
    let midRuns: int = 0;
    let innerRuns: int = 0;
    outer: for (i = 0; i < 5; i++) {
        outerRuns++;
        for (j = 0; j < 5; j++) {
            midRuns++;
            for (k = 0; k < 5; k++) {
                if (i == 1 && j == 0 && k == 0) {
                    break outer;
                }
                innerRuns++;
            }
        }
    }
    if (outerRuns != 2) {
        throw new Error("outer loop should run 2 times (i=0,1), got " + outerRuns);
    }
    if (midRuns != 6) {
        throw new Error("mid loop should count 6: i=0 all 5 j's plus i=1 j=0, got " + midRuns);
    }
    if (innerRuns != 25) {
        throw new Error("inner loop body should execute 25 times (all of i=0 iteration, then break at i=1), got " + innerRuns);
    }
    console.log("verified");
}
