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
 * @id STMT_08_08_018_PASS_for_labeled_break
 * @expect compile-pass
 * @section 8.8
 * @design for 循环使用 labeled break 提前退出循环体 — STATEMENTS.md §8.8, §8.10：break labelName 在带有标签的 for 循环中合法
 * @note 正向用例：loop1: for (let i = 0; i < 10; i++) { if (i == 3) break loop1; } labeled break 跳出单层 for
 */
function testForLabeledBreak(): void {
    let sum: int = 0
    loop1: for (let i: int = 0; i < 10; i++) {
        sum = sum + i
        if (i == 3) {
            break loop1
        }
    }
    console.log(sum)
}
