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
 * @id EXP_07_10_02_004_PASS_READONLY_CTOR_ASSIGN
 * @expect compile-pass
 * @section 7.10.2
 * @design 构造器中给 readonly 实例字段赋值：构造器内允许修改 readonly 字段
 * @note 正向用例：验证 readonly 字段可在构造器中初始化赋值
 */
class Person {
    public readonly id: int
    public readonly name: string
    constructor(id: int, name: string) {
        this.id = id
        this.name = name
    }
}
let p: Person = new Person(1, 'Alice')
