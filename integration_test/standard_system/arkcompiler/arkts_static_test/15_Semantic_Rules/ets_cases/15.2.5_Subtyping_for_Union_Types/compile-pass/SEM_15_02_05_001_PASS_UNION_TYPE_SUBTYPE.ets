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
 * @id SEM_15_02_05_001_PASS_UNION_TYPE_SUBTYPE
 * @expect compile-pass
 * @section 15.2.5
 * @design 验证联合类型子类型：U <: T 当且仅当 U 的每个成员 <: T
 * @note 正向用例：Dog|Cat 每个成员 <: Animal，所以 Dog|Cat <: Animal
 */
class Animal { public name: string= ''; }
class Dog extends Animal { public breed: string= ''; }
class Cat extends Animal { public color: string= ''; }
function acceptAnimal(a: Animal): string { return a.name; }
function main(): void {
    let dog: Dog = new Dog(); dog.name = 'Rex';
    let cat: Cat = new Cat(); cat.name = 'Whiskers';
    let pet: Animal; pet = dog; pet = cat;
    console.log(`Dog name: ${acceptAnimal(dog)}`);
    console.log(`Cat name: ${acceptAnimal(cat)}`);
}
