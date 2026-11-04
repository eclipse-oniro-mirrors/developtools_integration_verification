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
 * @id CLS_09_10_001_PASS_BASIC_INHERITANCE
 * @expect compile-pass
 * @section 9.10
 * @design 子类继承父类所有非静态可访问成员（public/protected），同时可以新增自有成员
 * @note 正向用例：基本继承，子类使用继承的方法和字段
 */
class Animal {
  public name: string = "Animal"
  protected age: int = 0

  public getName(): string {
    return this.name
  }

  protected getAge(): int {
    return this.age
  }

  public makeSound(): string {
    return "generic sound"
  }
}

class Dog extends Animal {
  public breed: string = "unknown"

  public getBreed(): string {
    return this.breed
  }

  public getInfo(): string {
    return this.getName() + " age " + this.getAge() + " breed " + this.breed
  }

  public makeSound(): string {
    return "bark"
  }
}

function testInheritance(): void {
  let d: Dog = new Dog()
  let name: string = d.getName()
  let info: string = d.getInfo()
  let sound: string = d.makeSound()
  let breed: string = d.getBreed()
}
