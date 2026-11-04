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
 * @id EXP_07_09_010_RUNTIME_THIS_IN_CTOR
 * @expect runtime
 * @section 7.9
 * @design 构造器中 this 运行时验证：构造器通过 this.field 初始化字段
 * @note 运行时用例：验证构造器中 this 正确引用正在构造的对象
 */
class MyClass {
    public name: string = ''
    public age: int = 0
    constructor(name: string, age: int) {
        this.name = name
        this.age = age
    }
}

function main(): void {
    let p: MyClass = new MyClass('Alice', 30)
    if (p.name != 'Alice') {
        throw new Error('assertion failed: name != Alice')
    }
    if (p.age != 30) {
        throw new Error('assertion failed: age != 30')
    }
console.log('verified')
}
