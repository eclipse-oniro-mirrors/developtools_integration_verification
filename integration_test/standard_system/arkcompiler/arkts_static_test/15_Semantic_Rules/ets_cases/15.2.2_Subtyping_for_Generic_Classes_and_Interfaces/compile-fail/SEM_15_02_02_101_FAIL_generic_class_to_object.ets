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
 * @id SEM_15_02_02_101_FAIL_generic_class_to_object
 * @expect compile-fail
 * @section 15.2.2
 * @design 泛型类（无直接超类）是 Object 的直接子类型：C<U,V> <: Object
 * @note 来自规范 15.2.2 例：example1(c) OK
 */
class C<U, V> {
    foo(u: U): U { return u }
    bar(v: V): V { return v }
}
function main(): void {
function example1(o: Object): void {
};
    let c: C<int, boolean> = new C<int, boolean>()
    example1(c)
}
