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
/*
 * @id SEM_15_08_00_002_PASS_INSTANCEOF_narrowing
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：instanceof 表达式用于类型收窄（智能类型转换）
 * @note 测试 instanceof 检查后的智能类型转换
 */

// 测试 instanceof 收窄
class Animal {
  public name: string = 'animal'
  
  move(): void {
    console.log(this.name + ' moves')
}
}

class Dog extends Animal {
  bark(): void {
    console.log('Woof!')
}
}

class Cat extends Animal {
  meow(): void {
    console.log('Meow!')
}
}

function testInstanceofNarrowing(animal: Animal): void {
  // instanceof 检查前的类型
  let a: Animal = animal
  
  // instanceof 检查后的智能类型转换
  if (a instanceof Dog) {
    // 在这个分支中，a 的智能类型是 Dog
    a.bark()  // OK: 智能类型是 Dog
    a.move()  // OK: Dog 继承自 Animal
  } else if (a instanceof Cat) {
    // 在这个分支中，a 的智能类型是 Cat
    a.meow()  // OK: 智能类型是 Cat
    a.move()  // OK: Cat 继承自 Animal
  } else {
    a.move()  // OK: 智能类型仍然是 Animal}
}
