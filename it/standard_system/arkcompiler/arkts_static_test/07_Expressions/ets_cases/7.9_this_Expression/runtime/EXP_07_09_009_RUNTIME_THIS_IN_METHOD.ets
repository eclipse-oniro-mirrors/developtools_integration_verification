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
 * @id EXP_07_09_009_RUNTIME_THIS_IN_METHOD
 * @expect runtime
 * @section 7.9
 * @design 实例方法中 this 运行时验证：this.field 返回当前对象的字段值
 * @note 运行时用例：验证实例方法中 this 正确引用当前对象
 */
class MyClass {
    public value: int = 0
    constructor(v: int) {
        this.value = v
    }
    getValue(): int {
        return this.value
    }
}

function main(): void {
    let a: MyClass = new MyClass(10)
    let b: MyClass = new MyClass(20)
    if (a.getValue() != 10) {
        throw new Error('assertion failed: a.getValue() != 10')
    }
    if (b.getValue() != 20) {
        throw new Error('assertion failed: b.getValue() != 20')
    }
console.log('verified')
}
