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
 * @id STMT_08_15_020_RUNTIME_try_nested_inner_catch
 * @expect runtime
 * @section 8.15
 * @design 验证嵌套 try-catch 中内层 catch 捕获异常后外层 catch 不执行
 * @note 内层 try 抛出的异常被内层 catch 捕获后不会向外传播，外层 catch 应不被触发
 */
function main(): void {
    let innerTryReached: int = 0;
    let innerCatchReached: int = 0;
    let outerTryReached: int = 0;
    let outerCatchReached: int = 0;
    let outerFinallyReached: int = 0;

    try {
        outerTryReached = 1;
        try {
            innerTryReached = 1;
            throw new Error("inner error");
            innerTryReached = -1;
        } catch (e) {
            innerCatchReached = 1;
        }
        outerTryReached = 2;
    } catch (e) {
        outerCatchReached = 1;
    } finally {
        outerFinallyReached = 1;
    }

    if (innerTryReached != 1) {
        throw new Error("inner try block did not execute");
    }
    if (innerCatchReached != 1) {
        throw new Error("inner catch block did not execute");
    }
    if (outerTryReached != 2) {
        throw new Error("outer try block did not complete after inner catch");
    }
    if (outerCatchReached != 0) {
        throw new Error("outer catch block should not execute when inner catch handled the error");
    }
    if (outerFinallyReached != 1) {
        throw new Error("outer finally block did not execute");
    }

    console.log("verified");
}
