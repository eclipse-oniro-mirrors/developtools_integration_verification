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
 * @id EXP_07_06_01_019_RUNTIME_BASIC_VALUES
 * @expect runtime
 * @section 7.6.1
 * @design 对象字面量运行时字段值验证：创建 Person 实例并通过对象字面量设置 name 和 age，验证值正确
 * @note 运行时用例：验证对象字面量创建的实例字段值正确
 */
class Person {
    public name: string = ''
    public age: number = 0
}

function main(): void {
    let p: Person = {name: 'Bob', age: 25}
    if (p.name != 'Bob') {
        throw new Error('assertion failed: name != Bob, got ' + p.name)
    }
    if (p.age != 25) {
        throw new Error('assertion failed: age != 25, got ' + p.age)
    }
console.log('verified')
}
