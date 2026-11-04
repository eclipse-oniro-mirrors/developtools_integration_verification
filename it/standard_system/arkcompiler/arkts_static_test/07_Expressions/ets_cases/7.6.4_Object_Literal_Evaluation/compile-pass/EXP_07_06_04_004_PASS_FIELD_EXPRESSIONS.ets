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
 * @id EXP_07_06_04_004_PASS_FIELD_EXPRESSIONS
 * @expect compile-pass
 * @section 7.6.4
 * @design 字段含表达式的对象字面量编译通过：字段值为函数调用和算术表达式，验证表达式求值可正常编译
 * @note 正向用例：验证字段值为表达式的对象字面量编译通过
 */
class Data {
    public sum: number = 0
    public product: number = 0
    public greeting: string = ''
}
function add(x: number, y: number): number {
    return x + y
}
function makeGreeting(name: string): string {
    return 'Hello, ' + name
}
let d: Data = {sum: add(1, 2), product: 3 * 4, greeting: makeGreeting('World')}
