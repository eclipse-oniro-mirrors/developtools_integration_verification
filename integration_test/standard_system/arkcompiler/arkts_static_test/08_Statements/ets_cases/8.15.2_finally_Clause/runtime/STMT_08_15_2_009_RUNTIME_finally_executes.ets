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
 * @id STMT_08_15_2_009_RUNTIME_finally_executes
 * @expect runtime
 * @section 8.15.2
 * @design 运行时验证finally子句始终执行：分别在try正常完成和异常完成两种场景下检查finally块是否被执行。使用boolean标记验证finally代码路径确实运行。
 * @note 运行时测试：验证finally的执行保证
 */
function main(): void {
    // Scenario 1: try completes normally
    let flag1: boolean = false;
    try {
        flag1 = false;
    } finally {
        flag1 = true;
    }
    if (flag1 != true) {
        throw new Error("FAIL: finally did not execute after normal completion");
    }

    // Scenario 2: try completes with exception, caught by catch
    let flag2: boolean = false;
    try {
        throw new Error("test");
    } catch (e) {
        // catch block
    } finally {
        flag2 = true;
    }
    if (flag2 != true) {
        throw new Error("FAIL: finally did not execute after caught exception");
    }

    console.log("verified");
}
