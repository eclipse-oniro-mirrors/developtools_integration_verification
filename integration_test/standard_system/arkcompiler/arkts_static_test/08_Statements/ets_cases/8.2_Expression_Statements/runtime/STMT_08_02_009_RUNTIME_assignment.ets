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
 * @id STMT_08_02_009_RUNTIME_assignment
 * @expect runtime
 * @section 8.2
 * @design 验证赋值表达式作为语句时的副作用，值被正确写入变量且表达式结果被丢弃不影响后续执行
 * @note 运行时验证赋值语句副作用
 */

let globalRuntimeVal: int = 0;

function setGlobal(v: int): void {
    globalRuntimeVal = v;
}

function main(): void {
    // 测试简单赋值副作用
    let x: int = 0;
    x = 42;
    if (x != 42) {
        throw new Error("Simple assignment side effect failed: expected x=42, got " + x);
    }

    // 测试链式赋值副作用
    let a: int = 0;
    let b: int = 0;
    a = b = 99;
    if (a != 99) {
        throw new Error("Chained assignment failed: expected a=99, got " + a);
    }
    if (b != 99) {
        throw new Error("Chained assignment failed: expected b=99, got " + b);
    }

    // 测试复合赋值副作用
    let y: int = 10;
    y += 5;
    if (y != 15) {
        throw new Error("Compound assignment += failed: expected y=15, got " + y);
    }
    y *= 2;
    if (y != 30) {
        throw new Error("Compound assignment *= failed: expected y=30, got " + y);
    }

    // 测试函数调用赋值副作用
    setGlobal(77);
    if (globalRuntimeVal != 77) {
        throw new Error("Function call assignment side effect failed: expected global=77, got " + globalRuntimeVal);
    }

    console.log("verified");
}
