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
 * @id SEM_15_09_03_008_PASS_override_with_object
 * @expect compile-pass
 * @section 15.9.3
 * @design Override compatibility with Object as supertype for all class types
 * @note Spec lines 150-228 - all subtypes of Object are valid overriding for Object parameter/return
 */
class Base {}
class Derived extends Base {}
enum E { One, Two }
interface BaseI {
    kinds_of_parameters<T extends Derived, U extends Base>(
        p01: Derived,
        p02: (q: Base) => Derived,
        p03: number,
        p04: T | U,
        p05: E,
        p06: Base[],
        p07: [Base, Base]
    ): void
    kinds_of_return_type(): Object
}
interface DerivedI extends BaseI {
    kinds_of_parameters(
        p1: Object,
        p2: Object,
        p3: Object,
        p4: Object,
        p5: Object,
        p6: Object,
        p7: Object
    ): void
}
interface Derived1 extends BaseI {
    kinds_of_return_type(): Base
}
interface Derived2 extends BaseI {
    kinds_of_return_type(): (q: Derived) => Base
}
interface Derived3 extends BaseI {
    kinds_of_return_type(): number
}
interface Derived4 extends BaseI {
    kinds_of_return_type(): number | string
}
interface Derived5 extends BaseI {
    kinds_of_return_type(): E
}
interface Derived6 extends BaseI {
    kinds_of_return_type(): Base[]
}
interface Derived7 extends BaseI {
    kinds_of_return_type(): [Base, Base]
}
function main(): void {}
