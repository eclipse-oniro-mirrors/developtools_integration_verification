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
 * @id STMT_08_06_011_RUNTIME_LabeledLoop
 * @expect runtime
 * @section 8.6
 * @design 带标签循环运行时正确性验证
 * @note 验证break label跳出外层循环、continue label跳到外层下一次迭代
 */
function main(): void {
    // break label: break out of outer for loop
    let breakSum: int = 0;
    outerBreak: for (let i: int = 0; i < 5; i++) {
        for (let j: int = 0; j < 5; j++) {
            if (i === 2 && j === 1) {
                break outerBreak;
            }
            breakSum++;
        }
    }
    // i=0: j=0..4 => 5 iterations
    // i=1: j=0..4 => 5 iterations
    // i=2: j=0 => 1 iteration, j=1 => break outer (not counted)
    // total = 5 + 5 + 1 = 11
    if (breakSum !== 11) {
        throw new Error("labeled break count expected 11 but got " + breakSum);
    }

    // continue label: skip to next iteration of outer for loop
    let continueSum: int = 0;
    outerContinue: for (let i: int = 0; i < 3; i++) {
        for (let j: int = 0; j < 3; j++) {
            if (j === 1) {
                continue outerContinue;
            }
            continueSum++;
        }
    }
    // i=0: j=0 -> count++, j=1 -> continue outer, so j=2 skipped
    // i=1: j=0 -> count++, j=1 -> continue outer, so j=2 skipped
    // i=2: j=0 -> count++, j=1 -> continue outer, so j=2 skipped
    // total = 3
    if (continueSum !== 3) {
        throw new Error("labeled continue sum expected 3 but got " + continueSum);
    }

    // break label with while loop
    let whileBreakSum: int = 0;
    outerWhile: while (true) {
        for (let i: int = 0; i < 5; i++) {
            if (i === 3) {
                break outerWhile;
            }
            whileBreakSum += i;
        }
    }
    // i=0,1,2 => sum=0+1+2=3
    if (whileBreakSum !== 3) {
        throw new Error("labeled while break sum expected 3 but got " + whileBreakSum);
    }

    console.log("verified");
}
