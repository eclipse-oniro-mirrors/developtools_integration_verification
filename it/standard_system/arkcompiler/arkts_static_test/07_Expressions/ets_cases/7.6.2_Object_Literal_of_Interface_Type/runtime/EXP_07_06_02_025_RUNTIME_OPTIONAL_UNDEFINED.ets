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
 * @id EXP_07_06_02_025_RUNTIME_OPTIONAL_UNDEFINED
 * @expect runtime
 * @section 7.6.2
 * @design 验证可跳过可选属性的值为 undefined
 * @note 运行时用例：验证可选属性在对象字面量中跳过后的值为 undefined
 */
interface Person {
    name: string
    age: number
    sex?: string
}

function main(): void {
    let b: Person = {name: 'Bob', age: 25}
    if (b.sex != undefined) {
        throw new Error('assertion failed: sex should be undefined')
    }
console.log('verified')
}
