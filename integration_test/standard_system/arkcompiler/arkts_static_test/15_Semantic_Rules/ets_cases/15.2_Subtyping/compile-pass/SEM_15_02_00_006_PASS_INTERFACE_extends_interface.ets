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
 * @id SEM_15_02_00_006_PASS_INTERFACE_extends_interface
 * @expect compile-pass
 * @section 15.2
 * @design 规范 15.2.1：接口 S 扩展接口 T，则 S <: T（S 是 T 的子类型）
 * @note 测试接口继承的子类型关系
 */

// 测试接口扩展的子类型关系
interface Animal {
  eat(): void
}

interface Pet extends Animal {
  name: string
  play(): void
}

class Dog implements Pet {
  public name: string = 'dog'
  
  eat(): void {
    console.log('Dog eats')
  }
  
  play(): void {
    console.log('Dog plays')
  }
}

function testInterfaceExtendsInterface(): void {
  let animal: Animal
  let pet: Pet
  let dog: Dog = new Dog()
  
  // Pet 是 Animal 的子类型
  animal = dog  // OK: Dog <: Pet <: Animal
  
  // Dog 是 Pet 的子类型
  pet = dog  // OK: Dog <: Pet
  
  animal.eat()
  pet.play()
}
