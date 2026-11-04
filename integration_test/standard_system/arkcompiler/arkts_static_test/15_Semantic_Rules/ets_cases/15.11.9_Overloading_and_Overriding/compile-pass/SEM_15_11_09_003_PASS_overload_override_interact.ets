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
 * @id SEM_15_11_09_003_PASS_overload_override_interact
 * @expect compile-pass
 * @section 15.11.9
 * @design Overload resolution at compile time, overriding dispatch at runtime
 * @note Spec lines 18-42
 */
class C1 {}
class C2 extends C1 {}
class A {
    foo(c: C2): void { console.log('A.C2')
}
    foo(c: C1): void { console.log('A.C1')
}
}
class B extends A {
    override foo(c: C2): void { console.log('B.C2')
}
}
function main(): void {
    let a: A = new B()
    a.foo(new C2())
    a.foo(new C1())
}
