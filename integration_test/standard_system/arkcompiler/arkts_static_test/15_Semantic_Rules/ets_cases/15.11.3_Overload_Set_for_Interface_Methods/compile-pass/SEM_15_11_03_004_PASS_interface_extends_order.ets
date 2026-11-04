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
 * @id SEM_15_11_03_004_PASS_interface_extends_order
 * @expect compile-pass
 * @section 15.11.3
 * @design Interface extends multiple superinterfaces, overload set order follows extends list
 * @note Spec lines 54-72, interface J extends I1, I2
 */
interface I1 {
    foo(x: number): void
}
interface I2 {
    foo(s: string): void
    foo(b: boolean): void
}
interface J extends I1, I2 {
    foo(): void
}
function main(): void {}
