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
 * @id SEM_15_11_09_004_PASS_single_override_both
 * @expect compile-pass
 * @section 15.11.9
 * @design Single method in subclass overrides several methods of superclass
 * @note Spec lines 58-83
 */
class C1 {}
class C2 extends C1 {}
class A {
    foo(c: C2): void {
        console.log('A.C2')
    }
    foo(c: C1): void {
        console.log('A.C1')
    }
}
class D extends A {
    foo(c: C1): void {
        console.log('D.C1')
    }
}
function main(): void {
    let a: A = new D()
    a.foo(new C2())
    a.foo(new C1())
}
