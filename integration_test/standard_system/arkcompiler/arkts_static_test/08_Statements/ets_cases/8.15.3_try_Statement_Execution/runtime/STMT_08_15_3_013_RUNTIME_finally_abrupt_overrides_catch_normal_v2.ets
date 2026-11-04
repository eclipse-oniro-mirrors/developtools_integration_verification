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
 * @id STMT_08_15_3_013_RUNTIME_finally_abrupt_overrides_catch_normal_v2
 * @expect runtime
 * @section 8.15.3
 * @design 验证规则6：finally 子句异常完成导致整个 try 语句异常完成，覆盖 catch 子句的正常完成。本测试在 try-catch-finally 中验证 catch 体完整执行后被 finally 抛出的异常所覆盖。
 * @note try 抛出 Error("original")，catch 正常处理并设置 catchExecuted 标志，finally 抛出 Error("finally overrides")。外层 catch 捕获 finally 异常，同时验证 catch 确实执行过。
 */

function executeTryCatchFinally(): void {
    try {
        throw new Error("original");
    } catch (e) {
        // catch completes normally — but finally will override
        let originalMsg: string = (e as Error).message;
        if (originalMsg != "original") {
            throw new Error("unexpected original error message");
        }
    } finally {
        throw new Error("finally overrides");
    }
}

function main(): void {
    let catchInTryExecuted: boolean = false;
    let finallyErrorCaught: boolean = false;
    let caughtMsg: string = "";

    // First, verify catch executes normally within try-catch-finally
    try {
        try {
            throw new Error("original");
        } catch (e) {
            catchInTryExecuted = true;
        } finally {
            throw new Error("finally overrides");
        }
    } catch (e2) {
        finallyErrorCaught = true;
        caughtMsg = (e2 as Error).message;
    }

    if (!catchInTryExecuted) {
        throw new Error("FAIL: catch block was not executed before finally threw");
    }
    if (!finallyErrorCaught) {
        throw new Error("FAIL: finally error was not caught by outer scope");
    }
    if (caughtMsg != "finally overrides") {
        throw new Error("FAIL: expected finally error, got: " + caughtMsg);
    }

    // Second, verify via helper function call
    let functionLevelCaught: boolean = false;
    let functionMsg: string = "";
    try {
        executeTryCatchFinally();
    } catch (e) {
        functionLevelCaught = true;
        functionMsg = (e as Error).message;
    }
    if (!functionLevelCaught) {
        throw new Error("FAIL: finally error from function call not caught");
    }
    if (functionMsg != "finally overrides") {
        throw new Error("FAIL: function-level finally error mismatch, got: " + functionMsg);
    }

    console.log("verified");
}
