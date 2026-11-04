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
 * @id CLS_09_10_035_FAIL_STATIC_NOT_INHERITED
 * @expect compile-fail
 * @section 9.10
 * @design static方法不被继承 — 子类无法通过实例访问父类static方法
 * @note 反向用例：子类引用不存在的static方法应编译失败
 */
class Base17 { static foo(): void {} }
class Child17 extends Base17 {}
function test(): void { Child17.foo() }
