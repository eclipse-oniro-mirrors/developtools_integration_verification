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
 * @id SEM_15_09_01_102_FAIL_override_not_compatible
 * @expect compile-fail
 * @section 15.9.1
 * @design Override with incompatible signature (parameter type not contravariant)
 * @note Spec line 87: override method_2(p: string) not override-compatible with method_2(p: number)
 */
class Base {
    method_2(p: number): void {}
}
class Derived extends Base {
    override method_2(p: string): void {}
}
function main(): void {}
