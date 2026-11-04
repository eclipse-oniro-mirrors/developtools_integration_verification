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
 * @id SEM_15_02_00_010_PASS_GEN_variance_covariant
 * @expect compile-pass
 * @section 15.2
 * @design 规范 15.2.2：泛型类 G<out T>，若 S <: T，则 G<S> <: G<T>（协变）
 * @note 测试泛型协变：使用 out 类型参数
 */

// 测试泛型协变（out 类型参数）
class Animal {
  public name: string = 'animal'
}

class Dog extends Animal {
  bark(): void {
    console.log('Woof!')
  }
}

class Box<out T> {
  public value: T
  
  constructor(v: T) {
    this.value = v
  }
}

function testGenericCovariance(): void {
  let dogBox: Box<Dog> = new Box<Dog>(new Dog())
  let animalBox: Box<Animal>
  
  // Box<Dog> 是 Box<Animal> 的子类型（协变）
  animalBox = dogBox  // OK: Box<Dog> <: Box<Animal>
  
  console.log(animalBox.value.name)
}
