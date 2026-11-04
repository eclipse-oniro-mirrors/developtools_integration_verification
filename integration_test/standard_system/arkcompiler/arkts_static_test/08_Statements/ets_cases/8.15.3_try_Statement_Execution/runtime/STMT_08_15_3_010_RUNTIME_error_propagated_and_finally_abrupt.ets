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
 * @id STMT_08_15_3_010_RUNTIME_error_propagated_and_finally_abrupt
 * @expect runtime
 * @section 8.15.3
 * @design 验证规则3和规则4：规则3—无 catch 子句时异常传播到调用者作用域；规则4—finally 子句异常完成时整个 try 异常完成。
 * @note 使用顶层辅助函数内 try-finally 抛出异常验证传播；嵌套 try 中 finally 抛出新异常验证覆盖原始异常。
 */

function throwWithoutCatch(): void {
    try {
        throw new Error("inner propagated error");
    } finally {
        // no catch: error propagates to caller, finally executes first
    }
}

function main(): void {
    // Rule 3: error propagation from try-finally (no catch) to outer catch
    let propagationCaught: boolean = false;
    try {
        throwWithoutCatch();
    } catch (e) {
        propagationCaught = true;
        let msg: string = (e as Error).message;
        if (msg != "inner propagated error") {
            throw new Error("propagated error message mismatch");
        }
    }
    if (!propagationCaught) {
        throw new Error("Rule 3 failed: error did not propagate to caller");
    }

    // Rule 4: finally abrupt completion overrides catch normal completion
    let finalResult: int = 0;
    try {
        try {
            throw new Error("original");
        } catch (e) {
            finalResult = 1;
        } finally {
            throw new Error("finally error");
        }
    } catch (e2) {
        finalResult = 2;
        let msg2: string = (e2 as Error).message;
        if (msg2 != "finally error") {
            throw new Error("finally error message mismatch");
        }
    }
    if (finalResult != 2) {
        throw new Error("Rule 4 failed: finally abrupt should override catch normal completion");
    }

    console.log("verified");
}
