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
 * @id STMT_08_02_003_PASS_function_call
 * @expect compile-pass
 * @section 8.2
 * @design 测试函数调用表达式作为语句，包括无参函数、带参函数和方法调用
 * @note 函数调用作为表达式语句应编译通过，返回值被丢弃
 */
let globalCounter: int = 0;

function incrementGlobal(): void {
    globalCounter++;
}

function addAndSet(a: int, b: int): void {
    globalCounter = a + b;
}

function testVoidFunctionCall(): void {
    incrementGlobal();
}

function testFunctionWithArgs(): void {
    addAndSet(3, 7);
}

function testMethodCallOnObject(): void {
    let arr: int[] = [1, 2, 3];
    arr.push(4);
    arr.shift();
}

function testBuiltinMethodCall(): void {
    let msg: string = "hello";
    msg.length;
    msg.charCodeAt(0);
}
