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
 * @id EXP_07_06_04_006_RUNTIME_NORMAL_COMPLETION
 * @expect runtime
 * @section 7.6.4
 * @design 正常完成验证：构造器成功执行，所有字段表达式成功求值并正确赋值，验证对象字面量正常完成路径
 * @note 运行时用例：验证对象字面量正常完成的所有条件
 */
class Person {
    public name: string = ''
    public age: number = 0
}

function main(): void {
    let p: Person = {name: 'Alice', age: 30}
    if (p.name != 'Alice') {
        throw new Error('assertion failed: name != Alice')
    }
    if (p.age != 30) {
        throw new Error('assertion failed: age != 30')
    }
console.log('verified')
}
