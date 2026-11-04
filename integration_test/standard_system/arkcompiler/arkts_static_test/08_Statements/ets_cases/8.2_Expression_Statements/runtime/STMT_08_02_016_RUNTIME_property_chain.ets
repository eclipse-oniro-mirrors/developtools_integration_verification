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
 * @id STMT_08_02_016_RUNTIME_property_chain
 * @expect runtime
 * @section 8.2
 * @design 运行时验证属性访问和方法链式调用作为表达式语句的副作用，返回值被丢弃
 * @note 验证方法链中每个调用副作用正确执行，属性访问不影响状态
 */

let chainCounter: int = 0;

class Chainable {
    value: int;
    constructor(v: int) {
        this.value = v;
    }
    add(x: int): Chainable {
        chainCounter++;
        this.value += x;
        return this;
    }
    multiply(x: int): Chainable {
        chainCounter++;
        this.value *= x;
        return this;
    }
    reset(v: int): Chainable {
        chainCounter++;
        this.value = v;
        return this;
    }
    getValue(): int {
        return this.value;
    }
}

function main(): void {
    // 测试双方法链式调用副作用
    chainCounter = 0;
    let obj: Chainable = new Chainable(1);
    obj.add(2).multiply(3);
    if (chainCounter != 2) {
        throw new Error("Method chain count failed: expected chainCounter=2, got " + chainCounter);
    }
    // (1+2)*3 = 9
    if (obj.value != 9) {
        throw new Error("Method chain value failed: expected obj.value=9, got " + obj.value);
    }

    // 测试三方法链式调用副作用
    chainCounter = 0;
    obj.add(1).multiply(2).add(3);
    if (chainCounter != 3) {
        throw new Error("Triple chain count failed: expected chainCounter=3, got " + chainCounter);
    }
    // ((9+1)*2)+3 = 23
    if (obj.value != 23) {
        throw new Error("Triple chain value failed: expected obj.value=23, got " + obj.value);
    }

    // 测试属性访问表达式语句不改变状态
    let saved: int = obj.value;
    obj.value;
    obj.value;
    if (obj.value != saved) {
        throw new Error("Property access statement should not modify value");
    }

    // 测试方法调用返回非链式值被丢弃
    let testObj: Chainable = new Chainable(5);
    chainCounter = 0;
    testObj.getValue();
    if (chainCounter != 0) {
        throw new Error("getValue should not increment chainCounter");
    }

    // 测试调用链中重置方法
    chainCounter = 0;
    obj.reset(100).add(50);
    if (chainCounter != 2) {
        throw new Error("Chain with reset count failed: expected chainCounter=2, got " + chainCounter);
    }
    if (obj.value != 150) {
        throw new Error("Chain with reset value failed: expected obj.value=150, got " + obj.value);
    }

    console.log("verified");
}
