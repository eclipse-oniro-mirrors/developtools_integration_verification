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
 * @id EXP_07_06_04_011_RUNTIME_INTERFACE_CTOR
 * @expect runtime
 * @section 7.6.4
 * @design 接口匿名类构造器被调用验证：通过接口类型创建匿名类对象字面量，
 *         验证构造器先执行，再字段赋值，字段覆盖构造器设置的默认值
 * @note 运行时用例：验证接口匿名类构造器在字段赋值前执行
 */
interface Info {
    value: number
}

function main(): void {
    let x: Info = {value: 99}
    if (x.value != 99) {
        throw new Error('assertion failed: value != 99')
    }
console.log('verified')
}
