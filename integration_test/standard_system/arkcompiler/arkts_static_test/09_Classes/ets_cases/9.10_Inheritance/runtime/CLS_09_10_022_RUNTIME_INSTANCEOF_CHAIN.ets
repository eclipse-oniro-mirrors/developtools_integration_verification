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
 * @id CLS_09_10_022_RUNTIME_INSTANCEOF_CHAIN
 * @expect runtime
 * @section 9.10
 * @design 运行时验证instanceof操作符在继承链上的行为：子类实例instanceof祖先类返回true
 * @note 运行时用例：建立三层继承链，验证instanceof对各层祖先类均返回true
 */
class Animal {
  public kind: string = "animal"
}

class Mammal extends Animal {
  public furColor: string = "brown"
}

class Dog extends Mammal {
  public breed: string = "labrador"
}

class Cat extends Mammal {
  public pattern: string = "striped"
}

class Robot {
  public model: string = "X1"
}

function main(): void {
  let a: Animal = new Animal()
  let m: Mammal = new Mammal()
  let d: Dog = new Dog()
  let c: Cat = new Cat()
  let r: Robot = new Robot()

  if (!(a instanceof Animal)) {
    throw new Error("Animal instanceof Animal should be true")
  }
  if (a instanceof Mammal) {
    throw new Error("Animal instanceof Mammal should be false")
  }

  if (!(m instanceof Animal)) {
    throw new Error("Mammal instanceof Animal should be true")
  }
  if (!(m instanceof Mammal)) {
    throw new Error("Mammal instanceof Mammal should be true")
  }

  if (!(d instanceof Dog)) {
    throw new Error("Dog instanceof Dog should be true")
  }
  if (!(d instanceof Mammal)) {
    throw new Error("Dog instanceof Mammal should be true")
  }
  if (!(d instanceof Animal)) {
    throw new Error("Dog instanceof Animal should be true")
  }
  if (d instanceof Cat) {
    throw new Error("Dog instanceof Cat should be false")
  }

  if (!(c instanceof Animal)) {
    throw new Error("Cat instanceof Animal should be true")
  }
  if (c instanceof Dog) {
    throw new Error("Cat instanceof Dog should be false")
  }

  if (r instanceof Animal) {
    throw new Error("Robot instanceof Animal should be false")
  }

  let ref: Animal = d
  if (!(ref instanceof Dog)) {
    throw new Error("via Animal ref: ref instanceof Dog should be true")
  }
  if (!(ref instanceof Mammal)) {
    throw new Error("via Animal ref: ref instanceof Mammal should be true")
  }

  console.log("instanceof chain verified")
}
