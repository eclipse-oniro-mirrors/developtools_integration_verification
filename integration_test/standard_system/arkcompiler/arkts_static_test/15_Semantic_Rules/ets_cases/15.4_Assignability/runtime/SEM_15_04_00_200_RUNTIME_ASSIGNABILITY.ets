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
 * @id SEM_15_04_00_200_RUNTIME_ASSIGNABILITY
 * @expect runtime
 * @section 15.4
 * @design 验证可赋值性运行时行为：子类型赋值后方法调用正确
 * @note 运行时用例：通过 Animal 引用调用 Dog 的覆写方法
 */
class Animal { public name: string= ''; speak(): string { return '...'; } }
class Dog extends Animal { speak(): string { return 'Woof!'; } }
function main(): void {
    let dog: Dog = new Dog();
    dog.name = 'Rex';
    let animal: Animal = dog;
    let sound: string = animal.speak();
    if (sound != 'Woof!') {
        throw new Error('assertion failed: expected Woof! got ' + sound);
    }
console.log('verified: ' + sound);
}
