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
 * @id STMT_08_07_012_PASS_do_while_body_try_catch
 * @expect compile-pass
 * @section 8.7
 * @design do-while 循环体内包含 try-catch 语句，验证 do 体可包含异常处理 — STATEMENTS.md §8.7
 * @note do 的 statement 可以是任何语句，包括 try-catch
 */
function testDoWhileBodyTryCatch(): void {
    let i: int = 0;
    do {
        try {
            i = i + 1;
            if (i == 2) {
                throw new Error("skip");
            }
        } catch (e) {
            i = i + 1;
        }
    } while (i < 5);
    let count: int = 0;
    do {
        try {
            count = count + 1;
        } catch (e) {
            count = 0;
        }
    } while (count < 3);
}
