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
 * @id EXP_07_06_01_015_FAIL_NO_PARAMLESS_CTOR
 * @expect compile-fail
 * @section 7.6.1
 * @design 类只有带必选参数的构造器，无无参构造器：class C { constructor(p: number) {} }，对象字面量应为编译时错误
 * @note 反向用例：验证使用对象字面量的类必须有无参构造器或全可选参数构造器
 */
class C {
    public name: string = ''
    constructor(p: number) {
    }
}
let c: C = {name: 'test'}
