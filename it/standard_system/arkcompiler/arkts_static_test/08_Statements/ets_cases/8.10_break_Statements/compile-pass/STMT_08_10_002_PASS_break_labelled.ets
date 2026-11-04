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
 * @id STMT_08_10_002_PASS_break_labelled
 * @expect compile-pass
 * @section 8.10
 * @design 在嵌套循环中使用带标签的break，跳出外层标记的循环
 * @note break with label transfers control to enclosing labeled loop statement
 */
function testBreakLabelled(): void {
    let i: int = 0;
    let j: int = 0;
    outer: while (i < 10) {
        inner: while (j < 10) {
            if (j == 5) {
                break outer;
            }
            j++;
        }
        i++;
    }
}
