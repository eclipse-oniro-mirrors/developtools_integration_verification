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
 * @id SEM_15_11_08_003_PASS_function_with_receiver
 * @expect compile-pass
 * @section 15.11.8
 * @design Functions with receiver considered for method call syntax, ordinary functions not
 * @note Spec lines 14-32
 */
class C {}
function foo(this: C): void {
    console.log('#1')
}
function foo(this: C, s: string): void {
    console.log('#2')
}
function foo(c: C, n: number): void {
    console.log('#3')
}
function main(): void {
    let c: C = new C()
    c.foo()
    foo(c)
}
