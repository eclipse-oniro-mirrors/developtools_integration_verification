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
 * @id SEM_15_09_03_005_PASS_function_type_override
 * @expect compile-pass
 * @section 15.9.3
 * @design Function types override with covariant/contravariant parameter and return
 * @note Spec lines 84-98
 */
class Base {}
class Derived extends Base {}
interface BaseI {
    param(p: (q: Base) => Derived): void
    ret(): (q: Derived) => Base
}
interface DerivedI extends BaseI {
    param(p: (q: Derived) => Base): void
    ret(): (q: Base) => Derived
}
function main(): void {}
