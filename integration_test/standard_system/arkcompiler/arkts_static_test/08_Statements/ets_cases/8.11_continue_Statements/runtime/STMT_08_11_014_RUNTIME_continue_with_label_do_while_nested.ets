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
 * @id STMT_08_11_014_RUNTIME_continue_with_label_do_while_nested
 * @expect runtime
 * @section 8.11
 * @design 验证在do-while嵌套for循环中使用带标签continue跳转到外层do-while条件检查的运行时行为
 * @note runtime test: spec example STATEMENTS.md line 358-368 — continue outer transfers to the do-while condition, skipping the rest of the do-while body and re-evaluating while(condition)
 */
function main(): void {
    let a: number = 0;
    let innerCount: number = 0;
    let outerReached: boolean = false;

    outer:
    do {
        for (a = 0; a < 10; a++) {
            if (a > 1) {
                continue outer; // transfer to while(false) → exit loop
            }
            innerCount++;
        }
        outerReached = true; // should never be reached
    } while (false);

    // innerCount should be 2: a=0 and a=1 only
    // When a=2, continue outer jumps to while(false), loop exits
    // outerReached should remain false
    if (innerCount != 2) {
        throw new Error(
            "continue with label in do-while: inner count wrong, expected 2 got " + innerCount
        );
    }
    if (outerReached) {
        throw new Error(
            "continue with label in do-while: 'Outer' was incorrectly reached"
        );
    }
    console.log("verified");
}
