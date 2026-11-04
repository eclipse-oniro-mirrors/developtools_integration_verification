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
 * @id CLS_09_10_011_RUNTIME_OVERRIDE_DISPATCH
 * @expect runtime
 * @section 9.10
 * @design 运行时验证虚方法分派：通过基类引用调用方法，实际执行派生类的重写版本
 * @note 运行时用例：基类引用指向派生类对象时，方法调用应派发到派生类的重写实现
 */
class Calculator {
  public compute(a: int, b: int): int {
    return a + b
  }

  public getName(): string {
    return "Calculator"
  }
}

class Multiplier extends Calculator {
  public compute(a: int, b: int): int {
    return a * b
  }

  public getName(): string {
    return "Multiplier"
  }
}

class Subtracter extends Calculator {
  public compute(a: int, b: int): int {
    return a - b
  }

  public getName(): string {
    return "Subtracter"
  }
}

function main(): void {
  let calc: Calculator = new Calculator()
  let mult: Multiplier = new Multiplier()
  let sub: Subtracter = new Subtracter()

  if (calc.compute(10, 5) != 15) {
    throw new Error("Calculator.compute failed: " + calc.compute(10, 5))
  }

  if (mult.compute(10, 5) != 50) {
    throw new Error("Multiplier.compute failed: " + mult.compute(10, 5))
  }

  if (sub.compute(10, 5) != 5) {
    throw new Error("Subtracter.compute failed: " + sub.compute(10, 5))
  }

  let ref1: Calculator = mult
  if (ref1.compute(10, 5) != 50) {
    throw new Error("virtual dispatch via base ref to Multiplier failed: " + ref1.compute(10, 5))
  }

  let ref2: Calculator = sub
  if (ref2.compute(10, 5) != 5) {
    throw new Error("virtual dispatch via base ref to Subtracter failed: " + ref2.compute(10, 5))
  }

  if (ref1.getName() != "Multiplier") {
    throw new Error("virtual dispatch getName failed: " + ref1.getName())
  }

  if (ref2.getName() != "Subtracter") {
    throw new Error("virtual dispatch getName failed: " + ref2.getName())
  }

  console.log("Override dispatch verified")
}
