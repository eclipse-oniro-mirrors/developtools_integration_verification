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
 * @id SEM_15_04_00_002_PASS_SUBTYPING_assignability
 * @expect compile-pass
 * @section 15.4
 * @design 规范 15.4：T1 可赋给 T2，如果 T1 是 T2 的子类型
 * @note 测试基于子类型的可赋值性
 */

// 测试基于子类型的可赋值性
class Animal {
  public name: string = 'animal'
}

class Dog extends Animal {
  bark(): void {
    console.log('Woof!')
  }
}

function testSubtypingAssignability(): void {
  let animal: Animal
  let dog: Dog = new Dog()
  
  // Dog 是 Animal 的子类型，所以 Dog 可赋给 Animal
  animal = dog  // OK: 基于子类型的可赋值性
  
  console.log(animal.name)
}

// 测试联合类型的可赋值性
function testUnionAssignability(): void {
  let x: number | string
  let y: number = 42
  let z: string = 'hello'
  
  // number 是 number | string 的子类型
  x = y  // OK: 基于子类型的可赋值性
    
  // string 是 number | string 的子类型
  x = z  // OK: 基于子类型的可赋值性
    
  console.log('Union assignability test passed')
}
