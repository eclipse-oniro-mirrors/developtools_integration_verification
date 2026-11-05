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
 * @id SEM_15_02_02_004_PASS_generic_interface_sub_assign
 * @expect compile-pass
 * @section 15.2.2
 * @design 泛型子接口实例可赋值给超接口类型变量：J<:I
 * @note 来自规范 15.2.2 例：i = j（J extends I → J<:I）
 */
interface I<U, V> {
    foo(u: U): U
    bar(v: V): V
}
interface J<U, V> extends I<U, V> {
    foo1(p: U|V): U|V
}
class Y<U, V> implements J<U, V> {
    foo(u: U): U { return u }
    bar(v: V): V { return v }
    foo1(p: U|V): U|V { return p }
}
function main(): void {
    let i: I<int, boolean>
    let j: J<int, boolean> = new Y<int, boolean>()
    i = j
}
