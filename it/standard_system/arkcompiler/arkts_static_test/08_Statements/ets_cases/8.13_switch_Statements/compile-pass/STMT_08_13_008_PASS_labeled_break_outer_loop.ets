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
 * @id STMT_08_13_008_PASS_labeled_break_outer_loop
 * @expect compile-pass
 * @section 8.13
 * @design switch 内使用带标签的 break 跳出外层循环（for/while）— STATEMENTS.md line 435: "break statement to transfer control out of a nested switch or loop statement"
 * @note 正向用例：outer: for 循环内嵌 switch，case 中使用 break outer 跳出外层循环；同时验证 outer2: while 循环场景
 */
function testLabeledBreakOuterForLoop(): void {
    let result: string = "";
    outer: for (let i: int = 0; i < 5; i++) {
        switch (i) {
            case 2:
                result = "break_at_2";
                break outer;
            default:
                break;
        }
    }
}

function testLabeledBreakOuterWhileLoop(): void {
    let result: string = "";
    let j: int = 0;
    outer2: while (j < 10) {
        switch (j) {
            case 3:
                result = "break_at_3";
                break outer2;
            default:
                break;
        }
        j++;
    }
}
