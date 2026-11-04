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
 * @id STMT_08_07_011_PASS_while_body_try_catch
 * @expect compile-pass
 * @section 8.7
 * @design while 循环体内包含 try-catch 语句，验证循环体可包含异常处理 — STATEMENTS.md §8.7
 * @note while 的 statement 可以是任何语句，包括 try-catch
 */
function testWhileBodyTryCatch(): void {
    let i: int = 0;
    while (i < 5) {
        try {
            i = i + 1;
            if (i == 3) {
                throw new Error("test");
            }
        } catch (e) {
            i = i + 1;
        }
    }
    let flag: boolean = true;
    let count: int = 0;
    while (flag) {
        try {
            count = count + 1;
            if (count >= 3) {
                flag = false;
            }
        } catch (e) {
            count = count - 1;
        }
    }
}
