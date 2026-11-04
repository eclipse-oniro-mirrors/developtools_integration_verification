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
 * @id SEM_15_02_05_004_PASS_union_to_base
 * @expect compile-pass
 * @section 15.2.5
 * @design Derived1 和 Derived2 都是 Base 的子类型，Derived1|Derived2 <: Base
 * @note 来自规范 15.2.5 例：x = y OK
 */
class Base {}
class Derived1 extends Base {}
class Derived2 extends Base {}
function main(): void {
    let x: Base
    let y: Derived1|Derived2 = new Derived1()
    x = y
}
