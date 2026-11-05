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
 * @id STMT_08_15_012_RUNTIME_try_finally_always
 * @expect runtime
 * @section 8.15
 * @design 验证 finally 子句始终执行（无论是否抛出异常）
 * @note finally 块不论 try 块是否抛出异常都会执行
 */
function main(): void {
    let finallyExecuted: int = 0;
    let catchExecuted: int = 0;

    try {
        finallyExecuted = 1;
    } finally {
        finallyExecuted = 2;
    }
    if (finallyExecuted != 2) {
        throw new Error("finally was not executed when no error thrown");
    }

    finallyExecuted = 0;
    try {
        throw new Error("error");
    } catch (e) {
        catchExecuted = 1;
    } finally {
        finallyExecuted = 3;
    }
    if (finallyExecuted != 3) {
        throw new Error("finally was not executed when error was thrown");
    }
    if (catchExecuted != 1) {
        throw new Error("catch was not executed when error was thrown");
    }

    console.log("verified");
}
