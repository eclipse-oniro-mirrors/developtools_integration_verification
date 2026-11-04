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
 * @id STMT_08_10_012_RUNTIME_break_deep_nested_unlabeled
 * @expect runtime
 * @section 8.10
 * @design 验证三层嵌套for循环中无标签break只跳出最内层，外层循环继续执行
 * @note Verify unlabeled break in 3-level nested loop exits only innermost, outer loops continue
 */
function main(): void {
    let i: int = 0;
    let j: int = 0;
    let k: int = 0;
    let innerExecutions: int = 0;
    let midExecutions: int = 0;
    let outerExecutions: int = 0;
    for (i = 0; i < 3; i++) {
        outerExecutions++;
        for (j = 0; j < 3; j++) {
            midExecutions++;
            for (k = 0; k < 3; k++) {
                if (k == 1) {
                    break;
                }
                innerExecutions++;
            }
        }
    }
    if (outerExecutions != 3) {
        throw new Error("outer loop should run 3 times, got " + outerExecutions);
    }
    if (midExecutions != 9) {
        throw new Error("mid loop should run 9 times, got " + midExecutions);
    }
    if (innerExecutions != 9) {
        throw new Error("inner loop should execute body 9 times (once per mid iteration before break at k=1), got " + innerExecutions);
    }
    console.log("verified");
}
