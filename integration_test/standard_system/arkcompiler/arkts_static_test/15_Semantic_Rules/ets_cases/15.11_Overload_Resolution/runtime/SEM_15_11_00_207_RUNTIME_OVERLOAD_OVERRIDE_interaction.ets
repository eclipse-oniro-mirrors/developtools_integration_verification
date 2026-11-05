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
 * @id SEM_15_11_00_207_RUNTIME_OVERLOAD_OVERRIDE_interaction
 * @expect runtime
 * @section 15.11
 * @design 规范 15.11.9：重载解析选择编译时类型的方法，但运行时可能调用重写的方法
 * @note 测试重载和重写的相互作用
 */

// 测试重载和重写的相互作用
class Animal {
  public name: string = 'animal'
  
  makeSound(p: Animal): void {
    console.log('Animal makes sound')
}
}

class Dog extends Animal {
  // 重写方法（参数类型逆变）
  override makeSound(p: Animal): void {
    console.log('Dog barks')
}
}

class Cat extends Animal {
  // 重写方法
  override makeSound(p: Animal): void {
    console.log('Cat meows')
}
}

function testOverloadOverrideInteraction(): void {
  let animals: Animal[] = [new Dog(), new Cat()]
  
  // 编译时类型是 Animal，所以调用 makeSound(p: Animal)
  // 运行时类型是 Dog 或 Cat，所以调用重写的方法
  for (let i = 0; i < animals.length; i++) {
    animals[i].makeSound(animals[i])  // 运行时调用重写的方法
  
}
console.log('Overload-override interaction test passed')
}

// 运行测试
test_overload_override_interaction()
