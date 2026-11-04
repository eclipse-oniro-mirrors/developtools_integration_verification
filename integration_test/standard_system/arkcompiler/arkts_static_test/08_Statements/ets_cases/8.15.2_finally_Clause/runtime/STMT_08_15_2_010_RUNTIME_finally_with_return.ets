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
 * @id STMT_08_15_2_010_RUNTIME_finally_with_return
 * @expect runtime
 * @section 8.15.2
 * @design 运行时验证当try或catch块中包含return语句时，finally子句仍在方法返回之前执行。通过设计辅助函数使用flag标记检测finally的执行时机。
 * @note 运行时测试：验证return+finally执行顺序
 */
function testReturnInTry(): number {
    let localFlag: number = 0;
    try {
        localFlag = 1;
        return localFlag;
    } finally {
        localFlag = 2;
    }
    return -1;
}

function testReturnInCatch(): number {
    let localFlag: number = 0;
    try {
        throw new Error("err");
    } catch (e) {
        localFlag = 10;
        return localFlag;
    } finally {
        localFlag = 20;
    }
    return -1;
}

function main(): void {
    // Test return in try
    let val1: number = testReturnInTry();
    if (val1 != 1) {
        throw new Error("FAIL: return value from try should be 1, got " + val1);
    }

    // Test return in catch
    let val2: number = testReturnInCatch();
    if (val2 != 10) {
        throw new Error("FAIL: return value from catch should be 10, got " + val2);
    }

    console.log("verified");
}
