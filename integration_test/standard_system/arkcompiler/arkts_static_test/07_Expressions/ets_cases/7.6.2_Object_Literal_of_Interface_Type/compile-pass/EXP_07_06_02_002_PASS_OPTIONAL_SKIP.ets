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
 * @id EXP_07_06_02_002_PASS_OPTIONAL_SKIP
 * @expect compile-pass
 * @section 7.6.2
 * @design 可选属性可跳过：sex?: "male"|"female" 在对象字面量中跳过，值设为 undefined
 * @note 正向用例：验证可选属性跳过规则
 */
interface Person {
    name: string
    age: number
    sex?: string
}
let b: Person = {name: 'Bob', age: 25}
