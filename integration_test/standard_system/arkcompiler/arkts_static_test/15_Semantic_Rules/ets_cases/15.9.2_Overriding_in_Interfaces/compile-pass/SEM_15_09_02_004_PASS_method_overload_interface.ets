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
 * @id SEM_15_09_02_004_PASS_method_overload_interface
 * @expect compile-pass
 * @section 15.9.2
 * @design method_2 overloading (not overriding) in subinterface
 * @note Spec lines 32-60, method_2(p: string)
 */
interface Base {
    method_2(p: number): void
}
interface Derived extends Base {
    method_2(p: string): void
}
function main(): void {}
