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
 * @id STMT_08_09_016_RUNTIME_break_continue
 * @expect runtime
 * @section 8.9
 * @design 运行时验证for-of循环中break提前退出和continue跳过当前迭代的行为
 * @note break在第3个元素时退出循环，continue跳过偶数元素，验证求和结果与迭代次数
 */
function main(): void {
    let arr: Array<int> = [1, 2, 3, 4, 5];
    let sumBreak: int = 0;
    let countBreak: int = 0;
    for (let x of arr) {
        countBreak++;
        if (x == 3) {
            break;
        }
        sumBreak += x;
    }
    if (sumBreak != 3) {
        throw new Error("Break sum mismatch: expected 3");
    }
    if (countBreak != 3) {
        throw new Error("Break count mismatch: expected 3");
    }

    let sumContinue: int = 0;
    let countContinue: int = 0;
    for (let x of arr) {
        countContinue++;
        if (x % 2 == 0) {
            continue;
        }
        sumContinue += x;
    }
    if (sumContinue != 9) {
        throw new Error("Continue sum mismatch: expected 9");
    }
    if (countContinue != 5) {
        throw new Error("Continue count mismatch: expected 5");
    }

    console.log("verified");
}
