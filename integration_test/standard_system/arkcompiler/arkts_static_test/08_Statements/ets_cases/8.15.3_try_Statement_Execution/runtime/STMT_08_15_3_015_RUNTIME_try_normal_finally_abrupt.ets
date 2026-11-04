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
 * @id STMT_08_15_3_015_RUNTIME_try_normal_finally_abrupt
 * @expect runtime
 * @section 8.15.3
 * @design 验证规则6扩展：try 块正常完成（无异常抛出），finally 子句异常完成（抛出异常），导致整个 try 语句异常完成。catch 子句不存在或被跳过。
 * @note try 体正常执行并赋值，无 catch 子句，finally 中抛出异常。验证 try 体确实执行过（赋值生效），但最终异常来自 finally。
 */

function tryNormalFinallyThrows(): void {
    try {
        // try block completes normally — no throw
        let dummy: int = 1;
    } finally {
        throw new Error("finally abrupt from normal try");
    }
}

function main(): void {
    // Scenario 1: try-finally (no catch), try normal, finally throws
    let tryExecuted: boolean = false;
    let finallyErrorCaught: boolean = false;
    let errMsg: string = "";

    try {
        try {
            tryExecuted = true;
            // try body completes normally
        } finally {
            throw new Error("finally abrupt from normal try");
        }
    } catch (e) {
        finallyErrorCaught = true;
        errMsg = (e as Error).message;
    }

    if (!tryExecuted) {
        throw new Error("FAIL: try body did not execute before finally threw");
    }
    if (!finallyErrorCaught) {
        throw new Error("FAIL: finally error from normal try not caught");
    }
    if (errMsg != "finally abrupt from normal try") {
        throw new Error("FAIL: finally error message mismatch, got: " + errMsg);
    }

    // Scenario 2: via helper function
    let funcCaught: boolean = false;
    let funcMsg: string = "";
    try {
        tryNormalFinallyThrows();
    } catch (e) {
        funcCaught = true;
        funcMsg = (e as Error).message;
    }
    if (!funcCaught) {
        throw new Error("FAIL: finally error from function not caught");
    }
    if (funcMsg != "finally abrupt from normal try") {
        throw new Error("FAIL: function-level finally error mismatch, got: " + funcMsg);
    }

    // Scenario 3: try-catch-finally where try is normal, catch is present but not executed, finally throws
    let catchNotExecuted: boolean = true;
    let normalFinallyCaught: boolean = false;
    try {
        try {
            // try normal, no throw
        } catch (e) {
            catchNotExecuted = false;
        } finally {
            throw new Error("finally overrides even when try was normal");
        }
    } catch (e) {
        normalFinallyCaught = true;
    }
    if (!catchNotExecuted) {
        throw new Error("FAIL: catch should not execute when try is normal");
    }
    if (!normalFinallyCaught) {
        throw new Error("FAIL: finally error from normal try-catch-finally not caught");
    }

    console.log("verified");
}
