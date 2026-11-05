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
 * @id EXP_07_06_01_010_PASS_PARTIAL_FIELDS
 * @expect compile-pass
 * @section 7.6.1
 * @design 部分字段提供，其余使用默认值：class Person 字段设默认值，{name: "Bob"} 只提供 name
 * @note 正向用例：验证对象字面量可只提供部分字段，其余字段使用默认值
 */
class Person {
    public name: string = ''
    public age: number = 0
    public email: string = 'unknown'
}
let p: Person = {name: 'Bob'}
