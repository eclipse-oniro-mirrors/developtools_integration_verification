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
 * @id EXP2_17_16_002_PASS_INSTANCEOF_CLASS
 * @expect compile-pass
 * @section 17.16
 * @design 使用 instanceof 检查用户自定义类的继承层次
 * @note 正向用例：验证 instanceof 对用户自定义类层次结构的编译通过
 */
class Animal {
  public name: string = 'animal'
}
class Dog extends Animal {
  bark(): void { console.log('woof') }
}
class Cat extends Animal {
  meow(): void { console.log('meow') }
}

function testInstanceofClass(): void {
  let a: Animal = new Dog()
  let isDog: boolean = a instanceof Dog
  let isCat: boolean = a instanceof Cat
  let isAnimal: boolean = a instanceof Animal
  console.log('isDog=' + isDog + ' isCat=' + isCat + ' isAnimal=' + isAnimal)
}
