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
 * @id STMT_08_11_011_RUNTIME_continue_in_while_loop_skip_even
 * @expect runtime
 * @section 8.11
 * @design 验证在while循环中使用无标签continue跳过偶数的运行时行为
 * @note runtime test: continue in while loop should skip even numbers
 */
function main(): void {
    let sum: number = 0;
    let i: number = 0;
    while (i < 10) {
        i++;
        if (i % 2 == 0) {
            continue;
        }
        sum += i;
    }
    // Expected: sum of odd numbers 1..9 = 1 + 3 + 5 + 7 + 9 = 25
    if (sum != 25) {
        throw new Error("continue in while loop did not skip even numbers, sum=" + sum);
    }
    console.log("verified");
}
