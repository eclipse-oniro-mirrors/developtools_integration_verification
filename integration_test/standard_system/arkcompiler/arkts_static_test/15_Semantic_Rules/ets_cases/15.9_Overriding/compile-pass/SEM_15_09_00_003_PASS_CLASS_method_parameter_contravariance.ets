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
 * @id SEM_15_09_00_003_PASS_CLASS_method_parameter_contravariance
 * @expect compile-pass
 * @section 15.9
 * @design 规范 15.9.3：重写方法的每个参数类型必须是被重写方法对应参数类型的超类型（逆变）
 * @note 测试类方法重写的参数类型逆变
 */

// 测试类方法重写的参数类型逆变
class Animal {
  public name: string = 'animal'
}

class Dog extends Animal {
  bark(): void {
    console.log('Woof!')
}
}

class Base {
  acceptAnimal(animal: Animal): void {
    console.log('Base accepts: ' + animal.name)
}
}

class Derived extends Base {
  // 参数类型逆变：Dog >: Animal
  override acceptAnimal(animal: Dog): void {
    console.log('Derived accepts dog: ' + animal.name)
    animal.bark()
}
}

function testMethodParameterContravariance(): void {
  let base: Base = new Derived()
  
  // 编译时类型是 Base，所以 acceptAnimal(Animal) 被调用
  // 运行时类型是 Derived，所以 Derived.acceptAnimal(Dog) 被调用
  // 因为 Dog <: Animal，所以传递 Animal 是安全的
  base.acceptAnimal(new Dog())  // OK: Dog <: Animal
}
