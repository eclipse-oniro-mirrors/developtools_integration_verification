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
 * @id STMT_08_15_3_012_RUNTIME_error_propagation_three_levels_no_catch
 * @expect runtime
 * @section 8.15.3
 * @design 验证规则5扩展：无 catch 子句时异常通过三层调用链传播。D 层 try-finally 抛出异常（无 catch），穿过 C、B 两层（均无 try-catch），到达 A 层被 catch 捕获。
 * @note 验证异常沿调用栈向上传播时跳过多个无 catch 保护的栈帧，最终在最外层被正确处理。
 */

function throwDeepLayerD(): void {
    try {
        throw new Error("triple-level error");
    } finally {
        // no catch: error propagates
    }
}

function intermediateLayerC(): void {
    throwDeepLayerD();
}

function intermediateLayerB(): void {
    intermediateLayerC();
}

function main(): void {
    let caught: boolean = false;
    let message: string = "";

    try {
        intermediateLayerB();
    } catch (e) {
        caught = true;
        message = (e as Error).message;
    }

    if (!caught) {
        throw new Error("FAIL: error did not propagate through three call levels");
    }
    if (message != "triple-level error") {
        throw new Error("FAIL: propagated error message mismatch, got: " + message);
    }

    console.log("verified");
}
