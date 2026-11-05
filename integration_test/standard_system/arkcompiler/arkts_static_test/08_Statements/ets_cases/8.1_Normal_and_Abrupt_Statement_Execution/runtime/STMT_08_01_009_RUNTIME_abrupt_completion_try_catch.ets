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
 * @id STMT_08_01_009_RUNTIME_abrupt_completion_try_catch
 * @expect runtime
 * @section 8.1
 * @design 验证 throw 语句产生异常完成，try-catch 捕获异常完成之后执行流恢复正常完成
 * @note 异常完成由 throw 触发，catch 捕获后语句恢复为正常完成状态
 */
function main(): void {
    // Test 1: throw causes abrupt completion, caught by catch
    let caught: boolean = false;
    let afterCatch: boolean = false;
    try {
        throw new Error("abrupt completion test");
        // statement after throw is never reached
    } catch (e) {
        caught = true;
    }
    afterCatch = true;
    if (caught != true) {
        throw new Error("abrupt completion: catch did not execute");
    }
    if (afterCatch != true) {
        throw new Error("abrupt completion: after-catch code did not execute");
    }

    // Test 2: nested try-catch with abort in inner try
    let innerCaught: boolean = false;
    let outerAfter: boolean = false;
    try {
        try {
            throw new Error("inner error");
        } catch (e) {
            innerCaught = true;
        }
        outerAfter = true;
    } catch (e) {
        // should not reach here
    }
    if (innerCaught != true) {
        throw new Error("abrupt completion: inner catch did not execute");
    }
    if (outerAfter != true) {
        throw new Error("abrupt completion: outer after inner did not execute");
    }

    // Test 3: finally executes after abrupt completion
    // wrapped in outer try-catch to prevent error propagation from main()
    let finallyExecuted: boolean = false;
    let finallyErrorCaught: boolean = false;
    try {
        try {
            throw new Error("test finally");
        } finally {
            finallyExecuted = true;
        }
    } catch (e) {
        finallyErrorCaught = true;
    }
    if (finallyExecuted != true) {
        throw new Error("abrupt completion: finally did not execute");
    }
    if (finallyErrorCaught != true) {
        throw new Error("abrupt completion: finally propagated error not caught");
    }

    console.log("verified");
}
