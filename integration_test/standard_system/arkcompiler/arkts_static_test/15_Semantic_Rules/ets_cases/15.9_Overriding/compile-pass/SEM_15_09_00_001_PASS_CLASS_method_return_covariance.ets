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
 * @id SEM_15_09_00_001_PASS_CLASS_method_return_covariance
 * @expect compile-pass
 * @section 15.9
 * @design 规范 15.9.3：重写方法的返回类型必须是被重写方法返回类型的子类型（协变）
 * @note 测试类方法重写的返回类型协变
 */

// 测试类方法重写的返回类型协变
class Animal {
  public name: string = 'animal'
}

class Dog extends Animal {
  bark(): void {
    console.log('Woof!')
}
}

class Base {
  getAnimal(): Animal {
    return new Animal()
  }
}

class Derived extends Base {
  // 返回类型协变：Dog <: Animal
  override getAnimal(): Dog {
    return new Dog()
  }
}

function testMethodReturnCovariance(): void {
  let base: Base = new Derived()
  
  // 运行时调用 Derived.getAnimal()
  let animal: Animal = base.getAnimal()
  console.log(animal.name)
  
  // 如果实际类型是 Dog，可以调用 Dog 的方法
  if (animal instanceof Dog) {
    animal.bark()
}
}
