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
 * @id EXP_07_06_01_005_PASS_IMPLICIT_DEFAULT_CTOR
 * @expect compile-pass
 * @section 7.6.1
 * @design 隐式默认构造器：class C {} 无显式构造器时编译器添加默认构造器，对象字面量合法
 * @note 正向用例：验证隐式默认构造器可用
 */
class C {
    public name: string = ''
}
let c: C = {name: 'test'}
