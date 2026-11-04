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
 * @id SEM_15_08_00_118_FAIL_INSTANCEOF_invalid_access
 * @expect compile-fail
 * @section 15.8
 * @design 规范 15.8：instanceof 检查后，智能类型转换只允许访问实际类型的成员
 * @note 测试 instanceof 检查后访问不存在的成员（应该编译失败）
 */

// 测试 instanceof 检查后访问不存在的成员（编译失败）
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

function testInstanceofInvalidAccess(animal: Animal): void {
  if (animal instanceof Dog) {
    // 在这个分支中，animal 的智能类型是 Dog
    animal.bark()  // OK: Dog 有 bark() 方法
    animal.move()  // OK: Dog 继承自 Animal，有 move() 方法
  }
  
  let a: Animal = new Animal()
  
  if (a instanceof Dog) {
    // 在这个分支中，a 的智能类型是 Dog
    a.bark()  // OK: Dog 有 bark() 方法
  }
  
  // 编译失败：在 instanceof 检查之前，不能访问子类特有的成员
  let animal2: Animal = new Dog()
  animal2.bark()  // Error: Property 'bark' does not exist on type 'Animal'
}
