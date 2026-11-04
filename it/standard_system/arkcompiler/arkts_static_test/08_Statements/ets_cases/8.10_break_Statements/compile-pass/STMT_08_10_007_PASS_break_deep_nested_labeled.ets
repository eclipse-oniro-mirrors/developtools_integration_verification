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
 * @id STMT_08_10_007_PASS_break_deep_nested_labeled
 * @expect compile-pass
 * @section 8.10
 * @design 在三层嵌套循环中使用带标签的break跳出中间层标记的循环
 * @note labeled break transfers control to enclosing labeled statement at 3+ levels deep
 */
function testBreakDeepNestedLabeled(): void {
    let i: int = 0;
    let j: int = 0;
    let k: int = 0;
    outer: for (i = 0; i < 3; i++) {
        mid: for (j = 0; j < 3; j++) {
            for (k = 0; k < 3; k++) {
                if (k == 1) {
                    break mid;
                }
            }
        }
    }
}
