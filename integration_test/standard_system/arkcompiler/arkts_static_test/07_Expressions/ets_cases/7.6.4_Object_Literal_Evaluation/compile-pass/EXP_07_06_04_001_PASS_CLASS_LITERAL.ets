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
 * @id EXP_07_06_04_001_PASS_CLASS_LITERAL
 * @expect compile-pass
 * @section 7.6.4
 * @design 命名类类型对象字面量编译通过：最基本的类上下文对象字面量，验证构造器可被调用且字段编译通过
 * @note 正向用例：验证类类型对象字面量编译通过的基本情况
 */
class Info {
    public name: string = ''
    public age: number = 0
}
let x: Info = {name: 'test', age: 10}
