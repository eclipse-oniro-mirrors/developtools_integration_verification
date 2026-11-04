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
 * @id STMT_08_07_013_RUNTIME_while_break_in_nested_if
 * @expect runtime
 * @section 8.7
 * @design while 内嵌套 if 使用 break 提前退出，验证 break 后循环不再执行且外部变量保留中间值 — STATEMENTS.md §8.7
 * @note break 仅退出最内层循环，外层 while 之后代码正常执行
 */
function main(): void {
    let i: int = 0;
    let sum: int = 0;
    while (i < 10) {
        i = i + 1;
        if (i == 7) {
            break;
        }
        sum = sum + i;
    }
    if (i != 7) {
        throw new Error("Expected i=7 after break, got " + i);
    }
    if (sum != 21) {
        throw new Error("Expected sum=21 after break, got " + sum);
    }
    // Verify break exits only inner while, outer continues
    let outer: int = 0;
    let inner: int = 0;
    while (outer < 3) {
        outer = outer + 1;
        inner = 0;
        while (inner < 5) {
            inner = inner + 1;
            if (inner == 2) {
                break;
            }
        }
        if (inner != 2) {
            throw new Error("Expected inner=2 after break, got " + inner);
        }
    }
    if (outer != 3) {
        throw new Error("Expected outer=3, got " + outer);
    }
    console.log("verified");
}
