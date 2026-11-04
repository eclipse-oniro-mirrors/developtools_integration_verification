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
 * @id SEM_15_09_02_103_FAIL_interface_multiple_override_same
 * @expect compile-fail
 * @section 15.9.2
 * @design More than one method of subinterface overrides the same method of superinterface
 * @note Spec lines 64-72
 */
interface I {
    foo(p: C): void
}
interface C extends I {
    foo(p: C): void
    foo(p: I): void
}
function main(): void {}
