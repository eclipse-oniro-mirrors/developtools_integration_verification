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
 * @id STMT_08_02_013_PASS_property_access_chain
 * @expect compile-pass
 * @section 8.2
 * @design 测试属性访问和方法链式调用作为表达式语句，返回值被丢弃
 * @note 属性访问和链式方法调用作为表达式语句应编译通过
 */

class ValueHolder {
    value: int;
    constructor(v: int) {
        this.value = v;
    }
    getValue(): int {
        return this.value;
    }
    setValue(v: int): ValueHolder {
        this.value = v;
        return this;
    }
    increment(): ValueHolder {
        this.value++;
        return this;
    }
}

function testPropertyAccessStatement(): void {
    let obj: ValueHolder = new ValueHolder(10);
    obj.value;
    obj.getValue();
}

function testMethodChainStatement(): void {
    let obj: ValueHolder = new ValueHolder(1);
    obj.setValue(20).setValue(30);
    obj.increment().increment();
    obj.setValue(5).increment().setValue(100);
}

function testBuiltinPropertyAccess(): void {
    let s: string = "hello";
    s.length;
    let arr: int[] = [1, 2, 3];
    arr.length;
}

function testBuiltinMethodCallDiscard(): void {
    let s: string = "world";
    s.substring(0, 2);
    s.charCodeAt(0);
    let arr: int[] = [10, 20, 30];
    arr.pop();
    arr.indexOf(20);
}
