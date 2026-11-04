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
 * @id SEM_15_09_03_002_PASS_generic_override_pattern
 * @expect compile-pass
 * @section 15.9.3
 * @design Generic method override compatibility template pattern
 * @note Spec lines 20-26
 */
class Base {
    foo<T>(p1: T): T { return p1 }
}
class Derived extends Base {
    override foo<U>(p1: U): U { return p1 }
}
function main(): void {
    let d: Derived = new Derived()
    let r: int = d.foo(42)
}
