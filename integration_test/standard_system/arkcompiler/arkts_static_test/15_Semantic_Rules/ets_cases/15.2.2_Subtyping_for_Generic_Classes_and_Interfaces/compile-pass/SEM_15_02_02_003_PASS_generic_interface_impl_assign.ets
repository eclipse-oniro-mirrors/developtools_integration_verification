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
 * @id SEM_15_02_02_003_PASS_generic_interface_impl_assign
 * @expect compile-pass
 * @section 15.2.2
 * @design 泛型接口实现实例可赋值给接口类型变量
 * @note 来自规范 15.2.2 例：i = x（X implements I<U,V>）
 */
interface I<U, V> {
    foo(u: U): U
    bar(v: V): V
}
class X<U, V> implements I<U, V> {
    foo(u: U): U { return u }
    bar(v: V): V { return v }
}
function main(): void {
let i: I<int, boolean> = new X<int, boolean>()
}
