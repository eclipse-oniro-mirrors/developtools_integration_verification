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
 * @id STMT_08_07_010_PASS_do_while_with_continue
 * @expect compile-pass
 * @section 8.7
 * @design do-while 循环体中使用 continue 语句，验证 continue 跳转到条件检查 — STATEMENTS.md §8.7
 * @note do-while 体内 continue 使执行流跳转到 while 条件表达式处继续判断
 */
function testDoWhileContinue(): void {
    let i: int = 0;
    let sum: int = 0;
    do {
        i = i + 1;
        if (i % 2 == 0) {
            continue;
        }
        sum = sum + i;
    } while (i < 10);
    let j: int = 0;
    do {
        j = j + 1;
        if (j < 3) {
            continue;
        }
        break;
    } while (j < 10);
}
