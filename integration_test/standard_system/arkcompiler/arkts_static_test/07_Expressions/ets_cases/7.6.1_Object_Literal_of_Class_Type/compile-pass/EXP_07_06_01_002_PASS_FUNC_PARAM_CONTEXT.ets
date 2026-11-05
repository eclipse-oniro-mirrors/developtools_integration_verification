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
 * @id EXP_07_06_01_002_PASS_FUNC_PARAM_CONTEXT
 * @expect compile-pass
 * @section 7.6.1
 * @design 函数参数提供上下文：foo({name: "Alice", age: 18}) 中 Person 类型从参数类型推断
 * @note 正向用例：验证函数参数上下文推断对象字面量的类类型
 */
class Person {
    public name: string = ''
    public age: number = 0
}
function foo(p: Person): void {}
foo({name: 'Alice', age: 18})
