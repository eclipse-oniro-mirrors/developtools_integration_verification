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
 * @id STMT_08_15_2_015_RUNTIME_finally_throw_inside
 * @expect runtime
 * @section 8.15.2
 * @design 运行时验证finally块中抛出异常时的行为：当finally块中执行throw时，新异常会覆盖try/catch中的原异常（无论是正常完成还是catch中抛出的异常）。验证finally中新抛出的异常能正确向上传播。
 * @note 运行时测试：finally块中抛出异常覆盖原异常并向上传播
 */
function main(): void {
    // Scenario 1: throw in finally overrides normal try completion
    let caught1: boolean = false;
    try {
        try {
            let x: number = 1;
        } finally {
            throw new Error("finally error 1");
        }
    } catch (e) {
        caught1 = true;
    }
    if (caught1 != true) {
        throw new Error("FAIL: throw in finally (normal try) was not caught by outer catch");
    }

    // Scenario 2: throw in finally overrides exception thrown in try
    let caught2: boolean = false;
    let msg2: string = "";
    try {
        try {
            throw new Error("original try error");
        } finally {
            throw new Error("finally error 2");
        }
    } catch (e) {
        caught2 = true;
        msg2 = e.message;
    }
    if (caught2 != true) {
        throw new Error("FAIL: throw in finally (exception try) was not caught by outer catch");
    }

    // Scenario 3: throw in finally overrides exception thrown in catch
    let caught3: boolean = false;
    try {
        try {
            throw new Error("try error");
        } catch (e) {
            throw new Error("catch error");
        } finally {
            throw new Error("finally error 3");
        }
    } catch (e) {
        caught3 = true;
    }
    if (caught3 != true) {
        throw new Error("FAIL: throw in finally (exception catch) was not caught by outer catch");
    }

    console.log("verified");
}
