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
 * @id STMT_08_15_2_011_RUNTIME_finally_with_error
 * @expect runtime
 * @section 8.15.2
 * @design 运行时验证当catch块中抛出新错误时，finally子句仍在该新错误传播之前执行。使用标志变量记录finally执行，确保异常路径下finally的语义正确。
 * @note 运行时测试：验证catch抛新异常时finally仍执行
 */
function main(): void {
    // Test: catch throws a new error, finally still executes before propagation
    let finallyExecuted: boolean = false;
    let caughtOuter: boolean = false;
    try {
        try {
            throw new Error("inner error");
        } catch (e) {
            // re-throw a new error
            throw new Error("new error from catch");
        } finally {
            finallyExecuted = true;
        }
    } catch (e) {
        caughtOuter = true;
    }

    if (finallyExecuted != true) {
        throw new Error("FAIL: finally did not execute when catch threw new error");
    }
    if (caughtOuter != true) {
        throw new Error("FAIL: outer catch did not catch the re-thrown error");
    }

    console.log("verified");
}
