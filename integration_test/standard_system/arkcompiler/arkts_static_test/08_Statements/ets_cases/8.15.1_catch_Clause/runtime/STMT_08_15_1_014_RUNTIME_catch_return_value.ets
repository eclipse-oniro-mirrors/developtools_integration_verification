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
 * @id STMT_08_15_1_014_RUNTIME_catch_return_value
 * @expect runtime
 * @section 8.15.1
 * @design 验证 catch 块根据 instanceof 类型收窄返回不同的值，函数调用方能正确接收返回值。
 * @note 运行时测试：process 函数内 catch 根据 ZeroDivisor instanceof 返回 -1，其他错误返回 0，正常路径返回计算结果。
 */
class ZeroDivisor extends Error {}

function divide(a: number, b: number): number {
    if (b == 0) {
        throw new ZeroDivisor();
    }
    return a / b;
}

function process(a: number, b: number): number {
    try {
        let res: number = divide(a, b);
        return res;
    } catch (e) {
        return e instanceof ZeroDivisor ? -1 : 0;
    }
}

function main(): void {
    let result: number = 0;

    // Normal division
    result = process(10, 2);
    if (result != 5) {
        throw new Error("normal division failed, expected 5, got: " + result);
    }

    // Division by zero (ZeroDivisor) should return -1
    result = process(10, 0);
    if (result != -1) {
        throw new Error("ZeroDivisor path failed, expected -1, got: " + result);
    }

    // Some other error should return 0
    // We simulate by throwing a plain Error inside a separate function test
    let otherCaught: number = -2;
    try {
        throw new Error("unexpected failure");
    } catch (e) {
        if (e instanceof ZeroDivisor) {
            otherCaught = -1;
        } else {
            otherCaught = 0;
        }
    }
    if (otherCaught != 0) {
        throw new Error("other error path failed, expected 0, got: " + otherCaught);
    }

    console.log("verified");
}
