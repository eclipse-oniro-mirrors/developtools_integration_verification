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
 * @id SEM_15_04_00_001_PASS_SUBTYPE_ASSIGNABILITY
 * @expect compile-pass
 * @section 15.4
 * @design 验证子类型可赋值性：S <: T ⇒ S 可赋值给 T
 * @note 正向用例：Dog <: Animal，Dog 可赋值给 Animal
 */
class Animal { public name: string= ''; }
class Dog extends Animal { public breed: string= ''; }
function main(): void {
    let dog: Dog = new Dog();
    dog.name = 'Buddy';
    let animal: Animal = dog;
    console.log(`Animal: ${animal.name}`);
}
