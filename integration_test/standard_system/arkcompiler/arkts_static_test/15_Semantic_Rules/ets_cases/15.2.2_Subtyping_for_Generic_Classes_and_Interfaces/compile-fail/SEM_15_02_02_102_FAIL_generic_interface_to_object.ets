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
 * @id SEM_15_02_02_102_FAIL_generic_interface_to_object
 * @expect compile-fail
 * @section 15.2.2
 * @design 泛型接口（无直接超接口）是 Object 的直接子类型：I<U,V> <: Object
 * @note 来自规范 15.2.2 例：example2(i) OK
 */
interface I<U, V> {
    foo(u: U): U
    bar(v: V): V
}
class D<U, V> implements I<U, V> {
    foo(u: U): U { return u }
    bar(v: V): V { return v }
}
function main(): void {
function example2(o: Object): void {
};
    let i: I<int, boolean> = new D<int, boolean>()
    example2(i)
}
