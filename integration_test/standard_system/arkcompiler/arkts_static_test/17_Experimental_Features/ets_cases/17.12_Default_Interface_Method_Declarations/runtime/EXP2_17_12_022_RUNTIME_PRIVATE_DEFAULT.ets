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
 * @id EXP2_17_12_022_RUNTIME_PRIVATE_DEFAULT
 * @expect runtime
 * @section 17.12
 * @design 接口声明私有默认方法，在公开默认方法中调用，运行时验证调用链正确且私有方法产生预期结果
 * @note 运行时用例：验证私有默认方法在内部调用链中的运行时行为
 */
interface IMathOps {
  calculate(a: int, b: int): int {
    let sum: int = this.doAdd(a, b)
    return this.doMultiply(sum, 2)
  }

  private doAdd(x: int, y: int): int {
    return x + y
  }

  private doMultiply(x: int, y: int): int {
    return x * y
  }
}

class MathWorker implements IMathOps {
}

function main(): void {
  let mw: MathWorker = new MathWorker()

  // calculate(3,4) = doAdd(3,4) * 2 = 7 * 2 = 14
  let r1: int = mw.calculate(3, 4)
  if (r1 != 14) {
    throw new Error("FAIL: expected 14, got " + r1)
  }

  // calculate(0,5) = doAdd(0,5) * 2 = 5 * 2 = 10
  let r2: int = mw.calculate(0, 5)
  if (r2 != 10) {
    throw new Error("FAIL: expected 10, got " + r2)
  }

  // calculate(10,0) = doAdd(10,0) * 2 = 10 * 2 = 20
  let r3: int = mw.calculate(10, 0)
  if (r3 != 20) {
    throw new Error("FAIL: expected 20, got " + r3)
  }

  console.log('PASS: private default methods work correctly')
}
