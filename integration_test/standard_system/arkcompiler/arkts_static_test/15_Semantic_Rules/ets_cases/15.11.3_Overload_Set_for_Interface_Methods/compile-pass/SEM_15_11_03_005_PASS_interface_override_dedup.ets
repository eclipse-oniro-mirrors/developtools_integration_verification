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
 * @id SEM_15_11_03_005_PASS_interface_override_dedup
 * @expect compile-pass
 * @section 15.11.3
 * @design Overridden methods occur only once in overload set (deduplication)
 * @note Spec lines 76-86, interface K overrides I2.foo
 */
interface I1 {
    foo(x: number): void
}
interface I2 {
    foo(s: string): void
    foo(b: boolean): void
}
interface K extends I1, I2 {
    foo(s: string): void
}
function main(): void {}
