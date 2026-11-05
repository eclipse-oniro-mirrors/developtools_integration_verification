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
 * @id EXP_07_06_02_001_PASS_BASIC_INTERFACE
 * @expect compile-pass
 * @section 7.6.2
 * @design 基本接口类型：普通属性 name、setter surname、getter age 映射为匿名类字段
 * @note 正向用例：验证接口类型上下文推断和多种属性形式的字段映射
 */
interface Person {
    name: string
    set surname(s: string)
    get age(): number
}
let b: Person = {name: 'Bob', surname: 'Doe', age: 25}
