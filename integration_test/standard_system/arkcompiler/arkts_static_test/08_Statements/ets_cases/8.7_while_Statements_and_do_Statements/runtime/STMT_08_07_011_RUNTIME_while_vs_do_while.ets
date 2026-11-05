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
 * @id STMT_08_07_011_RUNTIME_while_vs_do_while
 * @expect runtime
 * @section 8.7
 * @design 对比 while 和 do-while 在相同初始条件下的执行次数差异
 * @note 相同条件(初始 false)下，while 执行 0 次，do-while 执行 1 次
 */
function main(): void {
    let i: int = 0;
    let whileCount: int = 0;
    while (i < 0) {
        whileCount = whileCount + 1;
        i = i + 1;
    }
    let j: int = 0;
    let doWhileCount: int = 0;
    do {
        doWhileCount = doWhileCount + 1;
        j = j + 1;
    } while (j < 0);
    if (whileCount != 0) {
        throw new Error("while should execute 0 times, but got " + whileCount);
    }
    if (doWhileCount != 1) {
        throw new Error("do-while should execute at least 1 time, but got " + doWhileCount);
    }
    // Also verify positive iteration case
    let k: int = 0;
    let whileCount2: int = 0;
    while (k < 3) {
        whileCount2 = whileCount2 + 1;
        k = k + 1;
    }
    let m: int = 0;
    let doWhileCount2: int = 0;
    do {
        doWhileCount2 = doWhileCount2 + 1;
        m = m + 1;
    } while (m < 3);
    if (whileCount2 != 3) {
        throw new Error("while should execute 3 times, but got " + whileCount2);
    }
    if (doWhileCount2 != 3) {
        throw new Error("do-while should execute 3 times, but got " + doWhileCount2);
    }
    console.log("verified");
}
