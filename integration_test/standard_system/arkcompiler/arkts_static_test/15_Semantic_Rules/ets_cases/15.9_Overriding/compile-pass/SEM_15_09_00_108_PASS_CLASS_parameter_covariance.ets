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
 * @id SEM_15_09_00_108_FAIL_CLASS_parameter_covariance
 * @expect compile-pass
 * @section 15.9
 * @design 规范 15.9.3：重写方法的参数类型必须是被重写方法参数类型的超类型（不允许参数协变）
 * @note 测试无效重写：参数协变（应该编译失败）
 */

// 测试无效重写：参数协变（编译失败）
class Animal {
  public name: string = 'animal'
}

class Dog extends Animal {
  bark(): void {
    console.log('Woof!')
}
}

class Base {
  acceptDog(dog: Dog): void {
    console.log('Base accepts dog')
}
}

class Derived extends Base {
  // 编译失败：参数协变（Dog 是 Animal 的子类型，但重写方法不能缩小参数类型）
  override acceptDog(animal: Animal): void {
    console.log('Derived accepts animal')
}
}

