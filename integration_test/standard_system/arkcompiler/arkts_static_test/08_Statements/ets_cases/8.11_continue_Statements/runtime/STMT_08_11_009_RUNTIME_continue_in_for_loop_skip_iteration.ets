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
 * @id STMT_08_11_009_RUNTIME_continue_in_for_loop_skip_iteration
 * @expect runtime
 * @section 8.11
 * @design 验证在for循环中使用无标签continue跳过特定迭代（跳过3）的运行时行为
 * @note runtime test: continue in for loop should skip iteration when condition matches
 */
function main(): void {
    let sum: number = 0;
    // Sum numbers 0..4, skipping 3
    for (let i: number = 0; i < 5; i++) {
        if (i == 3) {
            continue;
        }
        sum += i;
    }
    // Expected: 0 + 1 + 2 + 4 = 7
    if (sum != 7) {
        throw new Error("continue in for loop did not skip iteration 3, sum=" + sum);
    }
    console.log("verified");
}
