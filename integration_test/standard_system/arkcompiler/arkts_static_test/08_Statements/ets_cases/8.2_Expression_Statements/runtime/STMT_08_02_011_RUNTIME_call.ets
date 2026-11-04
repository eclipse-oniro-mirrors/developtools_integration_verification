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
 * @id STMT_08_02_011_RUNTIME_call
 * @expect runtime
 * @section 8.2
 * @design 验证函数调用表达式作为语句时的副作用，全局状态被正确修改
 * @note 运行时验证函数调用语句副作用
 */

let callCounter: int = 0;
let callAccumulator: int = 0;

function incrementCounter(): void {
    callCounter++;
}

function addToAccumulator(val: int): void {
    callAccumulator += val;
}

function resetState(): void {
    callCounter = 0;
    callAccumulator = 0;
}

function main(): void {
    // 测试无参函数调用副作用
    resetState();
    incrementCounter();
    if (callCounter != 1) {
        throw new Error("Void function call side effect failed: expected callCounter=1, got " + callCounter);
    }
    incrementCounter();
    incrementCounter();
    if (callCounter != 3) {
        throw new Error("Multiple void function calls failed: expected callCounter=3, got " + callCounter);
    }

    // 测试带参函数调用副作用
    addToAccumulator(10);
    if (callAccumulator != 10) {
        throw new Error("Function with args side effect failed: expected callAccumulator=10, got " + callAccumulator);
    }
    addToAccumulator(20);
    addToAccumulator(30);
    if (callAccumulator != 60) {
        throw new Error("Multiple function calls accumulation failed: expected callAccumulator=60, got " + callAccumulator);
    }

    // 测试方法调用副作用 (push)
    let arr: int[] = [1, 2, 3];
    arr.push(4);
    if (arr.length != 4) {
        throw new Error("Method call push side effect failed: expected arr.length=4, got " + arr.length);
    }
    if (arr[3] != 4) {
        throw new Error("Method call push element failed: expected arr[3]=4, got " + arr[3]);
    }

    // 测试方法调用副作用 (shift)
    let first: int | undefined = arr.shift();
    if (first == undefined) {
        throw new Error("Method call shift returned undefined");
    }
    if (first != 1) {
        throw new Error("Method call shift side effect failed: expected first=1, got " + first);
    }
    if (arr.length != 3) {
        throw new Error("Method call shift length failed: expected arr.length=3, got " + arr.length);
    }

    console.log("verified");
}
