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
 * @id SEM_15_02_01_001_PASS_CLASS_EXTENDS_SUBTYPE
 * @expect compile-pass
 * @section 15.2.1
 * @design 验证非泛型类 extends 产生直接子类型关系：class B extends A → B <: A
 * @note 正向用例：Dog <: Animal，可赋值给 Animal 类型变量
 */
class Animal { public name: string= ''; speak(): string { return '...'; } }
class Dog extends Animal { public breed: string= ''; speak(): string { return 'Woof!'; } }
function acceptAnimal(a: Animal): void { console.log(a.speak()); }
function main(): void {
    let dog: Dog = new Dog(); dog.name = 'Rex'; dog.breed = 'Labrador';
    acceptAnimal(dog);
    let animal: Animal = dog;
    console.log(`Animal name: ${animal.name}`);
}
