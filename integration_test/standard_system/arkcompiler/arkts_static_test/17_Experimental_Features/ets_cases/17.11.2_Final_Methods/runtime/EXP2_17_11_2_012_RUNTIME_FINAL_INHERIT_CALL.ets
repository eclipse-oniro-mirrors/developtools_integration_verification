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
 * @id EXP2_17_11_2_012_RUNTIME_FINAL_INHERIT_CALL
 * @expect runtime
 * @section 17.11.2
 * @design 子类继承并调用 final 方法：验证子类不重写 final 方法时，可以继承并正确调用
 * @note 运行时用例：验证 final 方法通过继承链正确传递
 */
class Animal {
  final identify(): string {
    return 'Animal'
  }
}

class Dog extends Animal {
  // 不重写 identify，继承父类的 final 方法
  bark(): string {
    return 'Woof'
  }
}

class Poodle extends Dog {
  // 不重写 identify，继承链上的 final 方法
  getBreed(): string {
    return 'Poodle'
  }
}

function main(): void {
  let a: Animal = new Animal()
  if (a.identify() != 'Animal') {
    throw new Error('assertion failed: Animal.identify should return 'Animal'')
  }

  let d: Dog = new Dog()
  if (d.identify() != 'Animal') {
    throw new Error('assertion failed: Dog.identify should return 'Animal' via inheritance')
  }
  if (d.bark() != 'Woof') {
    throw new Error('assertion failed: Dog.bark should return 'Woof'')
  }

  let p: Poodle = new Poodle()
  if (p.identify() != 'Animal') {
    throw new Error('assertion failed: Poodle.identify should return 'Animal' via deep inheritance')
  }
  if (p.getBreed() != 'Poodle') {
    throw new Error('assertion failed: Poodle.getBreed should return 'Poodle'')
  }

  console.log('verified')
}
