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
 * @id CLS_09_07_018_PASS_INSTANCE_METHOD_COMPLEX_PARAMS
 * @expect compile-pass
 * @section 9.7.2
 * @design 实例方法使用复杂参数类型：数组参数、联合类型参数、可选参数以及多参数组合
 * @note 正向用例：实例方法接收数组、联合类型、可选参数等复杂类型参数
 */
class ArrayProcessor018 {
  private _sum: int = 0

  // Instance method with array parameter
  processNumbers(items: int[]): void {
    let len: int = items.length
    for (let i: int = 0; i < len; i++) {
      this._sum = this._sum + items[i]
    }
  }

  // Instance method receiving and returning array (literal)
  prefixAll(items: int[], prefix: int): int[] {
    let result: int[] = []
    let len: int = items.length
    for (let i: int = 0; i < len; i++) {
      result[i] = prefix + items[i]
    }
    return result
  }

  // Instance method with union type parameter (string | null)
  setLabel(label: string | null): void {
    if (label != null) {
      this._label = label
    }
  }

  // Instance method accepting optional parameter
  addBonus(base: int, bonus?: int): int {
    let b: int = 0
    if (bonus != undefined) {
      b = bonus
    }
    return base + b
  }

  // Instance method with boolean parameter for control flow
  toggleMode(active: boolean): void {
    if (active) {
      this._sum = 0
    }
  }

  getSum(): int {
    return this._sum
  }

  private _label: string = "default"

  getLabel(): string {
    return this._label
  }
}

class Calculator018 {
  private _result: double = 0.0

  // Multiple typed parameters with different types (int, double, string)
  compute(a: int, b: double, op: string): double {
    if (op == "add") {
      this._result = a + b
    } else if (op == "mul") {
      this._result = a * b
    } else {
      this._result = 0.0
    }
    return this._result
  }

  getResult(): double {
    return this._result
  }
}

function testComplexParamMethods(): void {
  let ap: ArrayProcessor018 = new ArrayProcessor018()
  let arr: int[] = [1, 2, 3, 4, 5]
  ap.processNumbers(arr)
  let s: int = ap.getSum()

  let prefixed: int[] = ap.prefixAll(arr, 10)

  ap.setLabel("myLabel")
  let lbl: string = ap.getLabel()

  ap.setLabel(null)
  let lbl2: string = ap.getLabel()

  let v1: int = ap.addBonus(100)
  let v2: int = ap.addBonus(100, 50)

  ap.toggleMode(true)

  let calc: Calculator018 = new Calculator018()
  let r1: double = calc.compute(10, 2.5, "add")
  let r2: double = calc.compute(3, 4.0, "mul")
}
