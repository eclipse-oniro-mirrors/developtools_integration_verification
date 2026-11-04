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
 * @id EXP_07_06_02_022_RUNTIME_BASIC_VALUES
 * @expect runtime
 * @section 7.6.2
 * @design 对象字面量字段值运行时验证：接口属性映射为匿名类字段，验证字段值正确
 * @note 运行时用例：验证接口对象字面量创建的实例字段值正确
 */
interface Person {
    name: string
    age: number
}

function main(): void {
    let b: Person = {name: 'Bob', age: 25}
    if (b.name != 'Bob') {
        throw new Error('assertion failed: name != Bob, got ' + b.name)
    }
    if (b.age != 25) {
        throw new Error('assertion failed: age != 25, got ' + b.age)
    }
console.log('verified')
}
