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
 * @id STMT_08_02_015_RUNTIME_constructor_call
 * @expect runtime
 * @section 8.2
 * @design 运行时验证new表达式作为语句时构造函数副作用正确执行，返回值被丢弃
 * @note 验证new表达式语句中构造函数副作用和参数求值
 */

let newCallCounter: int = 0;

class SideEffectClass {
    id: int;
    constructor(val: int) {
        newCallCounter++;
        this.id = val;
    }
}

function resetCtorState(): void {
    newCallCounter = 0;
}

function main(): void {
    // 测试单次构造函数调用副作用
    resetCtorState();
    new SideEffectClass(1);
    if (newCallCounter != 1) {
        throw new Error("Constructor call side effect failed: expected newCallCounter=1, got " + newCallCounter);
    }

    // 测试多次构造函数调用副作用
    resetCtorState();
    new SideEffectClass(10);
    new SideEffectClass(20);
    new SideEffectClass(30);
    if (newCallCounter != 3) {
        throw new Error("Multiple constructor calls failed: expected newCallCounter=3, got " + newCallCounter);
    }

    // 测试带表达式参数的构造调用
    resetCtorState();
    new SideEffectClass(5 + 10);
    if (newCallCounter != 1) {
        throw new Error("Constructor with expression arg failed: expected newCallCounter=1, got " + newCallCounter);
    }

    // 测试带变量参数的构造调用
    let arg: int = 50;
    newCallCounter = 0;
    new SideEffectClass(arg);
    if (newCallCounter != 1) {
        throw new Error("Constructor with variable arg failed: expected newCallCounter=1, got " + newCallCounter);
    }

    // 测试构造函数返回值被丢弃（无法通过成员访问获取）
    newCallCounter = 0;
    new SideEffectClass(99);
    // 副作用已发生但实例不可达
    if (newCallCounter != 1) {
        throw new Error("Constructor side effect with discarded return failed");
    }

    console.log("verified");
}
