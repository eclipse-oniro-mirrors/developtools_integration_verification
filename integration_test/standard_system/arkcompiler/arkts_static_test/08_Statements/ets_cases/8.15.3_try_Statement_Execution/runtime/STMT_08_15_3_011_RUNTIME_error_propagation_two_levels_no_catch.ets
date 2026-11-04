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
 * @id STMT_08_15_3_011_RUNTIME_error_propagation_two_levels_no_catch
 * @expect runtime
 * @section 8.15.3
 * @design 验证规则5扩展：无 catch 子句时异常通过两层调用链传播。C 层 try-finally 抛出异常（无 catch），传播经 B 层（无 try-catch）到达 A 层被 catch 捕获。
 * @note C 的 try-finally 抛出 Error("deep error")，B 直接调用 C 无防护，A(main) 用 try-catch 调用 B 并验证捕获的确实是 C 抛出的原始异常。
 */

function throwInTryFinallyNoCatchLayerC(): void {
    try {
        throw new Error("deep error");
    } finally {
        // no catch: error propagates upward through call stack
    }
}

function passThroughLayerB(): void {
    // B does not catch — error passes through to caller
    throwInTryFinallyNoCatchLayerC();
}

function main(): void {
    let caught: boolean = false;
    let msg: string = "";

    try {
        passThroughLayerB();
    } catch (e) {
        caught = true;
        msg = (e as Error).message;
    }

    if (!caught) {
        throw new Error("FAIL: error did not propagate through two call levels");
    }
    if (msg != "deep error") {
        throw new Error("FAIL: propagated error message mismatch, got: " + msg);
    }

    console.log("verified");
}
