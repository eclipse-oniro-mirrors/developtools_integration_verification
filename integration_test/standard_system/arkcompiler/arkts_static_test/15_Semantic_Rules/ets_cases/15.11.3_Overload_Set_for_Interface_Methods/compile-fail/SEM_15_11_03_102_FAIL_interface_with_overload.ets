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
 * @id SEM_15_11_03_102_FAIL_interface_with_overload
 * @expect compile-fail
 * @section 15.11.3
 * @design Interface with explicit overload declaration
 * @note Spec lines 40-50, interface J
 */
interface J {
    foo(x: number): void
    foo(s: string): void
    fooOpt(x?: number): void
    overload foo { foo, fooOpt }
}
function main(): void {}
