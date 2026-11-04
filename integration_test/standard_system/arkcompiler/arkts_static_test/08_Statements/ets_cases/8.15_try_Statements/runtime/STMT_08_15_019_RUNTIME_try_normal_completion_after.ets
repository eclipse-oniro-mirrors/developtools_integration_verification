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
 * @id STMT_08_15_019_RUNTIME_try_normal_completion_after
 * @expect runtime
 * @section 8.15
 * @design 验证 try-catch-finally 正常完成（无异常）后 try 语句之后的代码正常执行
 * @note try 块无异常时 catch 不执行，finally 始终执行，try 语句之后的代码继续按顺序执行
 */
function main(): void {
    let tryExecuted: int = 0;
    let catchExecuted: int = 0;
    let finallyExecuted: int = 0;
    let afterTry: int = 0;

    try {
        tryExecuted = 1;
    } catch (e) {
        catchExecuted = 1;
    } finally {
        finallyExecuted = 1;
    }

    afterTry = 42;

    if (tryExecuted != 1) {
        throw new Error("try block did not execute");
    }
    if (catchExecuted != 0) {
        throw new Error("catch block executed when no error was thrown");
    }
    if (finallyExecuted != 1) {
        throw new Error("finally block did not execute");
    }
    if (afterTry != 42) {
        throw new Error("code after try-catch-finally did not execute");
    }

    console.log("verified");
}
