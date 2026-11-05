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
 * @id STMT_08_07_001_PASS_basic_while
 * @expect compile-pass
 * @section 8.7
 * @design 基本 while 循环，使用布尔变量作为条件，验证合法的 while 语句通过编译
 * @note while 条件必须为 boolean 类型，此处使用布尔变量和比较表达式
 */
function testBasicWhile(): void {
    let i: int = 0;
    let condition: boolean = true;
    while (condition) {
        i = i + 1;
        if (i >= 5) {
            condition = false;
        }
    }
    let j: int = 0;
    while (j < 10) {
        j = j + 1;
    }
    let flag: boolean = false;
    while (flag) {
        // loop body not executed
    }
}
