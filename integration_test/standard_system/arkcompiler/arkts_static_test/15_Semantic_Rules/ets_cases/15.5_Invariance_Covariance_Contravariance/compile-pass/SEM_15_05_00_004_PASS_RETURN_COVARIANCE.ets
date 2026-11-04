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
 * @id SEM_15_05_00_004_PASS_RETURN_COVARIANCE
 * @expect compile-pass
 * @section 15.5
 * @design 验证返回值协变：子类覆写方法返回 Dog <: Animal 允许
 * @note 正向用例：返回类型可协变，Dog 是 Animal 的子类型
 */
class Animal { public name: string = ''; }
class Dog extends Animal { public breed: string = ''; }
class AnimalFactory { create(): Animal { let a: Animal = new Animal(); a.name = 'generic'; return a; } }
class DogFactory extends AnimalFactory {
    create(): Dog { let d: Dog = new Dog(); d.name = 'Doggo'; d.breed = 'Lab'; return d; }
}
function main(): void {
    let factory: AnimalFactory = new DogFactory();
    let result: Animal = factory.create();
    console.log(`Created: ${result.name}`);
}
