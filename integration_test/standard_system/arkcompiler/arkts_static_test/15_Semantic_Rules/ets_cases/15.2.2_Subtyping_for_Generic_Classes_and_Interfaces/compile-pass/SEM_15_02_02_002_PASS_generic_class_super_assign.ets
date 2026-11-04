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
 * @id SEM_15_02_02_002_PASS_generic_class_super_assign
 * @expect compile-pass
 * @section 15.2.2
 * @design 泛型类 C<U,V> extends T<U,V>，子类实例可赋值给超类类型变量
 * @note 来自规范 15.2.2 例：t = new C<int,boolean> OK
 */
class T<U, V> {
    foo(p: U|V): U|V { return p }
}
class C<U, V> extends T<U, V> {
    bar(u: U): U { return u }
}
function main(): void {
let t: T<int, boolean> = new C<int, boolean>()
}
