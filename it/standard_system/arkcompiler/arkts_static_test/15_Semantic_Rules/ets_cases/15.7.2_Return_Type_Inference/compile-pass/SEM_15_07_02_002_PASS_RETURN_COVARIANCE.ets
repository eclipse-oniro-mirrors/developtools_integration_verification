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
 * @id SEM_15_07_02_002_PASS_RETURN_COVARIANCE
 * @expect compile-pass
 * @section 15.7.2
 * @design 验证返回值协变：子类方法可返回子类型
 * @note 正向用例：覆写方法返回 Dog <: Animal，协变通过
 */
class Animal { public name: string = ''; }
class Dog extends Animal { public breed: string = ''; }
class Factory { make(): Animal { return new Animal(); } }
class DogFactory extends Factory { make(): Dog { return new Dog(); } }
function main(): void {
    let f: Factory = new DogFactory();
    let a: Animal = f.make();
    console.log(`a=${a.name}`);
}
