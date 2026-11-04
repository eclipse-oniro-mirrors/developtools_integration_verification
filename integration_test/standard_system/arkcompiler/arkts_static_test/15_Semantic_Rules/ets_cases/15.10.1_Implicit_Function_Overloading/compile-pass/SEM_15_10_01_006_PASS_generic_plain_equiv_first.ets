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
 * @id SEM_15_10_01_006_PASS_generic_plain_equiv_first
 * @expect compile-pass
 * @section 15.10.1
 * @design Generic before plain: instantiation with T=number, textually first used
 * @note Spec lines 30-54: foo<T>(x: T) then foo(x: number)
 */
function foo<T>(x: T): void {
    console.log('generic')
}
function foo(x: number): void {
    console.log('plain')
}
function main(): void {
    foo(1)
}
