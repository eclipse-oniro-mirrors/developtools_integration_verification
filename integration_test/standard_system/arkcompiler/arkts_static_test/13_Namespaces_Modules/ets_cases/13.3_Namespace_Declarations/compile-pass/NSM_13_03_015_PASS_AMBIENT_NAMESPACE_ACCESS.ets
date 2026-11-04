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
/*
 * @id NSM_13_03_015_PASS_AMBIENT_NAMESPACE_ACCESS
 * @expect compile-pass
 * @section 13.3
 * @design ambient namespace members accessible across module
 * @note declare namespace A makes A.foo() accessible in top-level
 *             statements, functions, and class methods
 */

declare namespace A {
    function foo(): void
    type X = number
}

A.foo() // Valid: accessible in top-level statements

function bar(): void {
    A.foo() // Valid: accessible inside function
}

class C {
    method(): void {
        A.foo() // Valid: accessible inside class method
        let x: A.X = 42 // Valid: type A.X can be used
    }
}
