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
 * @id SEM_15_08_01_101_FAIL_SMART_CAST_OUTSIDE
 * @expect compile-fail
 * @section 15.8.1
 * @design 验证不再使用 smart cast — 此场景编译器已知值类型，不验证作用域限制
 * @note ArkTS 编译器在值已知时可绕过 smart cast 作用域限制。
 *       此用例保留用于追踪编译器行为。
 */
class Animal { public name: string = ''; }
class Dog extends Animal { public breed: string = ''; }
function maybeDog(): Animal {
    return new Dog();
}
function main(): void {
    let a: Animal = maybeDog();
    if (a instanceof Dog) { }
    let d: Dog = a;
}
