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
 * @id STMT_08_06_010_RUNTIME_ForAndForOf
 * @expect runtime
 * @section 8.6
 * @design for和for-of循环运行时正确性验证
 * @note 验证for循环迭代计数、累加结果、continue和break行为，for-of遍历数组
 */
function main(): void {
    // for loop basic iteration
    let forSum: int = 0;
    for (let i: int = 0; i < 5; i++) {
        forSum += i;
    }
    if (forSum !== 10) {
        throw new Error("for loop sum expected 10 but got " + forSum);
    }

    // for loop with continue
    let continueSum: int = 0;
    for (let i: int = 0; i < 5; i++) {
        if (i === 2) {
            continue;
        }
        continueSum += i;
    }
    if (continueSum !== 8) {
        throw new Error("for continue sum expected 8 but got " + continueSum);
    }

    // for loop with break
    let breakSum: int = 0;
    for (let i: int = 0; i < 10; i++) {
        if (i >= 4) {
            break;
        }
        breakSum += i;
    }
    if (breakSum !== 6) {
        throw new Error("for break sum expected 6 but got " + breakSum);
    }

    // for loop with empty init
    let j: int = 0;
    let emptyInitSum: int = 0;
    for (; j < 3; j++) {
        emptyInitSum += j;
    }
    if (emptyInitSum !== 3) {
        throw new Error("for empty init sum expected 3 but got " + emptyInitSum);
    }

    // for-of basic traversal
    let arr: int[] = [10, 20, 30, 40];
    let ofSum: int = 0;
    for (let x of arr) {
        ofSum += x;
    }
    if (ofSum !== 100) {
        throw new Error("for-of sum expected 100 but got " + ofSum);
    }

    // for-of with empty array
    let empty: int[] = [];
    let emptyCount: int = 0;
    for (let y of empty) {
        emptyCount++;
    }
    if (emptyCount !== 0) {
        throw new Error("for-of empty count expected 0 but got " + emptyCount);
    }

    console.log("verified");
}
