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
 * @id SEM_15_02_02_106_FAIL_generic_class_sub_assign
 * @expect compile-fail
 * @section 15.2.2
 * @design 泛型超类实例不可赋值给子类类型变量
 * @note 来自规范 15.2.2 例：c = new T<int,boolean> 编译错误
 */
class T<U, V> {
    foo(p: U|V): U|V { return p }
}
class C<U, V> extends T<U, V> {
    bar(u: U): U { return u }
}
function main(): void {
let c: C<int, boolean> = new T<int, boolean>()
}
