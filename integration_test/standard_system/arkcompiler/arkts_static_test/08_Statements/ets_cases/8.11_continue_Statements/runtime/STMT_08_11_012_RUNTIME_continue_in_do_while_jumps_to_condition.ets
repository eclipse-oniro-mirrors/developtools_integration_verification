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
 * @id STMT_08_11_012_RUNTIME_continue_in_do_while_jumps_to_condition
 * @expect runtime
 * @section 8.11
 * @design 验证do-while循环中continue语句将控制权转移到while条件检查，而非循环体第一条语句
 * @note runtime test: continue in do-while must transfer to the condition evaluation, not re-execute the body from the start. The counter after continue stays unchanged, and the condition is re-evaluated.
 */
function main(): void {
    let postContinueExecuted: number = 0;
    let counter: number = 0;

    // do-while where continue skips the post-continue code and condition is re-evaluated
    do {
        counter++;
        if (counter == 3) {
            continue; // jump to while(counter < 5) — counter stays 3
        }
        postContinueExecuted++;
    } while (counter < 5);

    // Trace:
    // counter=1: skip if, post=1, while(1<5) true
    // counter=2: skip if, post=2, while(2<5) true
    // counter=3: continue → while(3<5) true  (post stays 2, counter stays 3)
    // counter=4: skip if, post=3, while(4<5) true
    // counter=5: skip if, post=4, while(5<5) false → exit
    // Expected: postContinueExecuted=4, counter=5
    if (postContinueExecuted != 4 || counter != 5) {
        throw new Error(
            "continue in do-while did not jump to condition: postContinueExecuted=" +
            postContinueExecuted + " counter=" + counter
        );
    }
    console.log("verified");
}
