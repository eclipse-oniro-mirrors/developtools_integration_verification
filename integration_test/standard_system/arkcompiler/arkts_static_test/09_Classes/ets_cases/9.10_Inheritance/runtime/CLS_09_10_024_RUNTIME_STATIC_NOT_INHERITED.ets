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
 * @id CLS_09_10_024_RUNTIME_STATIC_NOT_INHERITED
 * @expect runtime
 * @section 9.10
 * @design 运行时验证静态方法不被继承：父类静态方法不通过子类名调用，只能通过父类名显式限定调用
 * @note 运行时用例：验证父类静态成员通过父类名访问正常工作，子类不继承父类静态成员
 */
class MathBase {
  public static PI: double = 3.1415926
  public static counter: int = 0

  public static add(a: int, b: int): int {
    MathBase.counter = MathBase.counter + 1
    return a + b
  }

  public static multiply(a: int, b: int): int {
    MathBase.counter = MathBase.counter + 1
    return a * b
  }

  public static getCallCount(): int {
    return MathBase.counter
  }
}

class AdvancedMath extends MathBase {
  public static square(x: int): int {
    return x * x
  }

  public static sumAndSquare(a: int, b: int): int {
    let s: int = MathBase.add(a, b)
    return s * s
  }
}

function main(): void {
  let r1: int = MathBase.add(3, 4)
  if (r1 != 7) {
    throw new Error("MathBase.add failed: " + r1)
  }

  let r2: int = MathBase.multiply(5, 6)
  if (r2 != 30) {
    throw new Error("MathBase.multiply failed: " + r2)
  }

  if (MathBase.getCallCount() != 2) {
    throw new Error("MathBase.getCallCount after 2 calls failed: " + MathBase.getCallCount())
  }

  if (MathBase.PI < 3.14 || MathBase.PI > 3.15) {
    throw new Error("MathBase.PI failed: " + MathBase.PI)
  }

  let sq: int = AdvancedMath.square(7)
  if (sq != 49) {
    throw new Error("AdvancedMath.square failed: " + sq)
  }

  let ss: int = AdvancedMath.sumAndSquare(3, 4)
  if (ss != 49) {
    throw new Error("AdvancedMath.sumAndSquare failed: " + ss)
  }

  if (MathBase.getCallCount() != 3) {
    throw new Error("MathBase.getCallCount after AdvancedMath.sumAndSquare failed: " + MathBase.getCallCount())
  }

  console.log("static methods not inherited verified")
}
