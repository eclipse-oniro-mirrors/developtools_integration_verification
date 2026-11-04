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
 * @id SEM_15_09_03_006_PASS_union_type_override
 * @expect compile-pass
 * @section 15.9.3
 * @design Union types override with contravariant parameter and covariant return
 * @note Spec lines 101-129
 */
class BaseSuperType {}
class Base extends BaseSuperType {}
class Derived extends Base {}
interface BaseI {
    param<T extends Derived, U extends Base>(p: T | U): void
    ret<T extends Derived, U extends Base>(): T | U
}
interface DerivedI extends BaseI {
    param<T extends Base, U extends Object>(p: Base | BaseSuperType): void
    ret<T extends Base, U extends BaseSuperType>(): T | U
}
function main(): void {}
