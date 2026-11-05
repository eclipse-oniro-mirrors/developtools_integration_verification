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
 * @id SEM_15_11_00_005_PASS_INTERFACE_method_overload
 * @expect compile-pass
 * @section 15.11
 * @design 规范 15.11.3：接口方法的重载集包含接口定义的方法和继承的方法
 * @note 测试接口方法重载解析
 */

// 测试接口方法重载解析
interface Animal {
  makeSound(): void
}

interface Pet extends Animal {
  // 重载方法
  play(): void
  play(toy: string): void
}

class Dog implements Pet {
  makeSound(): void {
    console.log('Woof!')
}
  
  play(): void {
    console.log('Dog plays')
}
  
  play(toy: string): void {
    console.log('Dog plays with ' + toy)
}
}

function testInterfaceMethodOverload(): void {
  let dog: Dog = new Dog()
  
  // 重载解析：选择第一个匹配的方法
  dog.play()  // 调用 play()
  dog.play('ball')  // 调用 play(toy: string)
  
  let pet: Pet = dog
  pet.makeSound()  // 调用 Dog.makeSound()
  
  console.log('Interface method overload test passed')
}
