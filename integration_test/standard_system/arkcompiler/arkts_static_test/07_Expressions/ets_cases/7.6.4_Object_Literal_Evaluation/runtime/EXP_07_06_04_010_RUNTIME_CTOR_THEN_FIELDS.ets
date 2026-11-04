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
 * @id EXP_07_06_04_010_RUNTIME_CTOR_THEN_FIELDS
 * @expect runtime
 * @section 7.6.4
 * @design 构造器先于字段赋值验证：构造器将 value 设为 42，对象字面量字段提供 100，
 *         验证最终值为 100（构造器先执行，字段后赋值覆盖）
 * @note 运行时用例：验证构造器执行在字段赋值之前，字段覆盖构造器的值
 */
class Data {
    public value: number = 0
    constructor() {
        this.value = 42
    }
}

function main(): void {
    let d: Data = {value: 100}
    if (d.value != 100) {
        throw new Error('assertion failed: value != 100, got ' + d.value)
    }
console.log('verified')
}
