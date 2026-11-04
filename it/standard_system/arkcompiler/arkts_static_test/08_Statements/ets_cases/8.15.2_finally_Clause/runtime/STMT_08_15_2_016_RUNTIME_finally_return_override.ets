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
 * @id STMT_08_15_2_016_RUNTIME_finally_return_override
 * @expect runtime
 * @section 8.15.2
 * @design 运行时验证finally块中的return覆盖try或catch中的return值：当finally包含return语句时，该return值成为最终的返回值，覆盖try或catch块中的return。验证finally的return优先语义。
 * @note 运行时测试：验证finally中return覆盖try/catch中return的真实行为
 */
function tryReturnOverridden(): number {
    try {
        return 100;
    } finally {
        // This return overrides the try block's return of 100
        return 200;
    }
}

function catchReturnOverridden(): number {
    try {
        throw new Error("err");
    } catch (e) {
        return 300;
    } finally {
        // This return overrides the catch block's return of 300
        return 400;
    }
}

function tryNormalThenFinallyReturn(): number {
    let val: number = 0;
    try {
        val = 50;
        return val;
    } finally {
        val = 60;
        return val;
    }
}

function main(): void {
    // Test 1: return in finally overrides return in try
    let r1: number = tryReturnOverridden();
    if (r1 != 200) {
        throw new Error("FAIL: finally return should override try return, expected 200 got " + r1);
    }

    // Test 2: return in finally overrides return in catch
    let r2: number = catchReturnOverridden();
    if (r2 != 400) {
        throw new Error("FAIL: finally return should override catch return, expected 400 got " + r2);
    }

    // Test 3: finally assignment and return overrides try return
    let r3: number = tryNormalThenFinallyReturn();
    if (r3 != 60) {
        throw new Error("FAIL: finally changed val and returned, expected 60 got " + r3);
    }

    console.log("verified");
}
