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
 * @id SEM_15_10_02_003_PASS_inherited_method_overload
 * @expect compile-pass
 * @section 15.10.2
 * @design Inherited method overload from superclass
 * @note Spec lines 20-38
 */
class Base {
    foo(p: number): void {
        console.log('Base.number')
    }
}
class Derived extends Base {
    foo(p: string): void {
        console.log('Derived.string')
    }
}
function main(): void {
    let d: Derived = new Derived()
    d.foo(5)
    d.foo('5')
}
