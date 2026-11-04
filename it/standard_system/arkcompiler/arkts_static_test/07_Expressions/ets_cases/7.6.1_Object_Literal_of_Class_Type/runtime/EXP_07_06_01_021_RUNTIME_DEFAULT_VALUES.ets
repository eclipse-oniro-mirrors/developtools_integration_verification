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
 * @id EXP_07_06_01_021_RUNTIME_DEFAULT_VALUES
 * @expect runtime
 * @section 7.6.1
 * @design 默认值运行时验证：对象字面量只提供部分字段，跳过字段应使用默认值
 * @note 运行时用例：验证对象字面量中跳过的字段使用正确的默认值
 */
class Person {
    public name: string = ''
    public age: number = 0
    public email: string = 'unknown'
}

function main(): void {
    let p: Person = {name: 'Bob'}
    if (p.name != 'Bob') {
        throw new Error('assertion failed: name != Bob, got ' + p.name)
    }
    if (p.age != 0) {
        throw new Error('assertion failed: age != 0, got ' + p.age)
    }
    if (p.email != 'unknown') {
        throw new Error('assertion failed: email != unknown, got ' + p.email)
    }
console.log('verified')
}
