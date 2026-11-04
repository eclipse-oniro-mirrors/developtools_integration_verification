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
 * @id SEM_15_09_01_005_PASS_single_overrides_multiple
 * @expect compile-pass
 * @section 15.9.1
 * @design Single method in subclass overrides several methods of superclass
 * @note Spec lines 106-127
 */
class A {}
class B {}
class C {
    foo(a: A): void {
        console.log('C.A')
    }
    foo(b: B): void {
        console.log('C.B')
    }
}
class D extends C {
    foo(o: Object): void {
        console.log('D.Object')
    }
}
function main(): void {
    let c: C = new D()
    c.foo(new A())
    c.foo(new B())
}
