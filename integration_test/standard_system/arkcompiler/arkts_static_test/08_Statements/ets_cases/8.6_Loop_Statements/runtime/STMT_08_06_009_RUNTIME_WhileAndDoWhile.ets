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
 * @id STMT_08_06_009_RUNTIME_WhileAndDoWhile
 * @expect runtime
 * @section 8.6
 * @design while和do-while循环运行时正确性验证
 * @note 验证while循环条件判断、do-while至少执行一次、continue和break在循环中的行为
 */
function main(): void {
    // while loop basic iteration
    let i: int = 0;
    let whileSum: int = 0;
    while (i < 5) {
        whileSum += i;
        i++;
    }
    if (whileSum !== 10) {
        throw new Error("while loop sum expected 10 but got " + whileSum);
    }

    // while loop with continue
    let j: int = 0;
    let continueCount: int = 0;
    while (j < 5) {
        j++;
        if (j === 3) {
            continue;
        }
        continueCount++;
    }
    if (continueCount !== 4) {
        throw new Error("while continue count expected 4 but got " + continueCount);
    }

    // while loop with break
    let k: int = 0;
    let breakSum: int = 0;
    while (k < 10) {
        if (k >= 3) {
            break;
        }
        breakSum += k;
        k++;
    }
    if (breakSum !== 3) {
        throw new Error("while break sum expected 3 but got " + breakSum);
    }

    // do-while executes at least once even if condition is false
    let doCount: int = 0;
    do {
        doCount++;
    } while (false);
    if (doCount !== 1) {
        throw new Error("do-while count expected 1 but got " + doCount);
    }

    // do-while basic iteration
    let m: int = 0;
    let doSum: int = 0;
    do {
        doSum += m;
        m++;
    } while (m < 4);
    if (doSum !== 6) {
        throw new Error("do-while sum expected 6 but got " + doSum);
    }

    // do-while with continue
    let n: int = 0;
    let doContinueCount: int = 0;
    do {
        n++;
        if (n === 2) {
            continue;
        }
        doContinueCount++;
    } while (n < 5);
    if (doContinueCount !== 4) {
        throw new Error("do-while continue count expected 4 but got " + doContinueCount);
    }

    console.log("verified");
}
