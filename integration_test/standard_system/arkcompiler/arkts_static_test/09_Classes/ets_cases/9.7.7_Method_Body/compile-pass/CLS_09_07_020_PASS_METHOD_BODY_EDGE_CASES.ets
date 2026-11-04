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
 * @id CLS_09_07_020_PASS_METHOD_BODY_EDGE_CASES
 * @expect compile-pass
 * @section 9.7.7
 * @design void方法允许return;或无return；throw可替代return；abstract方法允许分号
 * @note 正向用例：方法体边界场景合法声明
 */
class EdgeCaseMethods020 {
  // void method with plain return (no expression) - valid
  maybeLog(flag: boolean): void {
    if (!flag) {
      return
    }
    let msg: string = "logged"
  }

  // void method with no return at all - valid
  doNothing(): void {
    let x: int = 0
    x = x + 1
  }

  // Non-void method that always throws - no return needed on throw path
  alwaysFails(): int {
    throw new Error("always fails")
  }

  // Method with return after conditional throw (throw covers else path)
  requirePositive(val: int): int {
    if (val <= 0) {
      throw new Error("must be positive")
    }
    return val
  }

  // Return in both try and catch blocks
  safeDivide(a: int, b: int): int {
    try {
      return a / b
    } catch (e) {
      return 0
    }
  }

  // While loop with return inside (loop condition ensures execution)
  firstMatch(n: int): int {
    let i: int = 0
    while (i < n) {
      if (i * i > n) {
        return i
      }
      i = i + 1
    }
    return -1
  }
}

abstract class AbstractEdge020 {
  // Abstract method with semicolon - valid
  abstract process(data: string): int

  // Abstract method with no body at all (semicolon style) - valid
  abstract name(): string

  // Concrete void method with plain return
  validate(): void {
    return
  }
}

class ConcreteEdge020 extends AbstractEdge020 {
  override process(data: string): int {
    // Return a computed value based on input
    if (data == "") {
      return 0
    }
    return 1
  }

  override name(): string {
    return "EdgeProcessor"
  }
}
