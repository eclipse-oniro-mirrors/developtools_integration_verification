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
 * @id SEM_15_02_00_011_PASS_GEN_variance_contravariant
 * @expect compile-pass
 * @section 15.2
 * @design 规范 15.2.2：泛型类 G<in T>，若 T <: S，则 G<S> <: G<T>（逆变）
 * @note 测试泛型逆变：使用 in 类型参数
 */

// 测试泛型逆变（in 类型参数）
class Animal {
  public name: string = 'animal'
}

class Dog extends Animal {
  bark(): void {
    console.log('Woof!')
  }
}

class Cage<in T> {
  // 逆变：只能写入 T，不能读取 T
  put(value: T): void {
    console.log('Put value')
  }
}

function testGenericContravariance(): void {
  let animalCage: Cage<Animal> = new Cage<Animal>()
  let dogCage: Cage<Dog>
  
  // Cage<Animal> 是 Cage<Dog> 的子类型（逆变）
  dogCage = animalCage  // OK: Cage<Animal> <: Cage<Dog>
  
  console.log('Contravariance test passed')
}
