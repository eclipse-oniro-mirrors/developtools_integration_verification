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
 * @id EXP_07_16_001_PASS_BASIC_INSTANCEOF
 * @expect compile-pass
 * @section 7.16
 * @design 验证基本 instanceof 表达式：子类实例 instanceof 父类/子类返回正确 boolean
 * @note 正向用例：基本类层次结构 instanceof 检查
 */
class A {}
class B extends A {}

let a: A = new B()
let r1: boolean = a instanceof B
let r2: boolean = a instanceof A
let r3: boolean = (new A()) instanceof B
