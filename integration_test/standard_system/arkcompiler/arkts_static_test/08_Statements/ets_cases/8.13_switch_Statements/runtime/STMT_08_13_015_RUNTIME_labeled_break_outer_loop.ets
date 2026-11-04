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
 * @id STMT_08_13_015_RUNTIME_labeled_break_outer_loop
 * @expect runtime
 * @section 8.13
 * @design switch 内使用带标签的 break 跳出外层循环（for/while）— STATEMENTS.md line 435: identifier label 允许 break 跳出嵌套的 switch 或 loop
 * @note 运行时验证：outer: for 循环内嵌 switch，case 中使用 break outer 跳出外层 for 循环；outer2: while 循环同理；验证循环计数正确
 */
function main(): void {
    // Test 1: labeled break from switch exits outer for loop
    let result: string = "";
    let iterationCount: int = 0;
    outer: for (let i: int = 0; i < 10; i++) {
        iterationCount++;
        switch (i) {
            case 3:
                result = "break_at_3";
                break outer;
            default:
                break;
        }
    }
    if (result != "break_at_3") {
        throw new Error("Test 1 for-loop: expected 'break_at_3', got '" + result + "'");
    }
    if (iterationCount != 4) {
        throw new Error("Test 1 for-loop: expected 4 iterations (0,1,2,3), got " + iterationCount);
    }

    // Test 2: labeled break from switch exits outer while loop
    let result2: string = "";
    let j: int = 0;
    let whileIterations: int = 0;
    outer2: while (j < 10) {
        whileIterations++;
        switch (j) {
            case 4:
                result2 = "break_at_4";
                break outer2;
            default:
                break;
        }
        j++;
    }
    if (result2 != "break_at_4") {
        throw new Error("Test 2 while-loop: expected 'break_at_4', got '" + result2 + "'");
    }
    if (whileIterations != 5) {
        throw new Error("Test 2 while-loop: expected 5 iterations (0-4), got " + whileIterations);
    }
    if (j != 4) {
        throw new Error("Test 2 while-loop: expected j=4, got " + j);
    }

    // Test 3: normal break exits only switch, loop continues
    let result3: string = "";
    let count3: int = 0;
    for (let k: int = 0; k < 5; k++) {
        switch (k) {
            case 2:
                result3 += "L2";
                break;
            default:
                break;
        }
        count3++;
    }
    if (result3 != "L2") {
        throw new Error("Test 3 normal break: expected 'L2', got '" + result3 + "'");
    }
    if (count3 != 5) {
        throw new Error("Test 3 normal break: expected 5 iterations, got " + count3);
    }

    // Test 4: nested loops — break outer from deep within switch
    let result4: string = "";
    let outerCount: int = 0;
    outer3: for (let a: int = 0; a < 5; a++) {
        outerCount++;
        for (let b: int = 0; b < 5; b++) {
            switch (a + b) {
                case 3:
                    result4 = "sum_3_break";
                    break outer3;
                default:
                    break;
            }
        }
    }
    if (result4 != "sum_3_break") {
        throw new Error("Test 4 nested loops: expected 'sum_3_break', got '" + result4 + "'");
    }

    console.log("verified");
}
