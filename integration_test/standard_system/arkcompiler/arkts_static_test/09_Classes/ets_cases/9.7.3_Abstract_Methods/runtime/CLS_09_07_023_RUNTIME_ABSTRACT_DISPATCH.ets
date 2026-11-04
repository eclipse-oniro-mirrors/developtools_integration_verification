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
 * @id CLS_09_07_023_RUNTIME_ABSTRACT_DISPATCH
 * @expect runtime
 * @section 9.7.3
 * @design 抽象方法运行时派发：通过基类引用调用抽象方法，验证多态派发到正确的子类实现
 * @note 正向用例：基类引用指向子类实例时，抽象方法调用应派发到子类具体实现
 */
abstract class Calculator {
  abstract compute(a: int, b: int): int

  describe(): string {
    return "Calculator"
  }
}

class Adder extends Calculator {
  compute(a: int, b: int): int {
    return a + b
  }
}

class Multiplier extends Calculator {
  compute(a: int, b: int): int {
    return a * b
  }
}

function main(): void {
  let calc: Calculator = new Adder()
  let result1: int = calc.compute(3, 4)
  let desc1: string = calc.describe()

  // Polymorphic dispatch: Adder.compute should be called
  if (result1 == 7) {
    console.log("verified")
  }

  let calc2: Calculator = new Multiplier()
  let result2: int = calc2.compute(3, 4)

  // Polymorphic dispatch: Multiplier.compute should be called
  if (result2 == 12) {
    console.log("verified")
  }
}
