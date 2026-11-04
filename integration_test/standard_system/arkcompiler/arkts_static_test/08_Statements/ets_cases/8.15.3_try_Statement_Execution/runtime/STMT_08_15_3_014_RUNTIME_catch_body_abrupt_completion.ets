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
 * @id STMT_08_15_3_014_RUNTIME_catch_body_abrupt_completion
 * @expect runtime
 * @section 8.15.3
 * @design 验证规则2扩展：catch 子句体自身异常完成（抛出异常）时，整个 try 语句异常完成。catch 中抛出的新异常取代原始异常向外传播。
 * @note try 抛出 Error("original")，catch 捕获后抛出 Error("catch rethrow")，无 finally 子句。外层 catch 应捕获 catch 中抛出的异常而非原始异常。
 */

function catchBodyThrows(): void {
    try {
        throw new Error("original");
    } catch (e) {
        // catch body completes abruptly by throwing a new error
        throw new Error("catch rethrow");
    }
}

function main(): void {
    // Scenario 1: inline try-catch where catch body throws
    let caughtNew: boolean = false;
    let msg1: string = "";
    try {
        try {
            throw new Error("original");
        } catch (e) {
            throw new Error("catch rethrow");
        }
    } catch (e2) {
        caughtNew = true;
        msg1 = (e2 as Error).message;
    }
    if (!caughtNew) {
        throw new Error("FAIL: catch body abrupt completion not propagated");
    }
    if (msg1 != "catch rethrow") {
        throw new Error("FAIL: expected catch rethrow error, got: " + msg1);
    }

    // Scenario 2: via helper function
    let functionCaught: boolean = false;
    let msg2: string = "";
    try {
        catchBodyThrows();
    } catch (e) {
        functionCaught = true;
        msg2 = (e as Error).message;
    }
    if (!functionCaught) {
        throw new Error("FAIL: catch body throw from function not caught");
    }
    if (msg2 != "catch rethrow") {
        throw new Error("FAIL: function-level catch error mismatch, got: " + msg2);
    }

    // Scenario 3: verify catch body DOES execute before throwing
    let catchExecuted: boolean = false;
    try {
        try {
            throw new Error("trigger");
        } catch (e) {
            catchExecuted = true;
            throw new Error("after catch execution");
        }
    } catch (e2) {
        // expected
    }
    if (!catchExecuted) {
        throw new Error("FAIL: catch body did not execute before its own throw");
    }

    console.log("verified");
}
