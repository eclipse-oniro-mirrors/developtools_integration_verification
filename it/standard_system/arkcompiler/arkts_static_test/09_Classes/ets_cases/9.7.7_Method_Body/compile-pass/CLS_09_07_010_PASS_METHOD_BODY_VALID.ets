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
 * @id CLS_09_07_010_PASS_METHOD_BODY_VALID
 * @expect compile-pass
 * @section 9.7.7
 * @design 合法的方法体形式：block体实现、void方法无return、条件分支均有return、abstract方法无体
 * @note 正向用例：各种合法方法体声明
 */
abstract class Calculator010 {
  abstract compute(a: int, b: int): int

  // Abstract method with no body
  abstract name(): string

  // Abstract method with semicolon
  abstract version(): int
}

class Adder010 extends Calculator010 {
  override compute(a: int, b: int): int {
    return a + b
  }

  override name(): string {
    return "Adder"
  }

  override version(): int {
    return 1
  }
}

class Formatter010 {
  // void method with no return statement - valid
  log(message: string): void {
    let prefix: string = "[LOG] "
    let full: string = prefix + message
  }

  // void method with conditional empty return - valid
  printIf(flag: boolean): void {
    if (!flag) {
      return
    }
    let msg: string = "printing"
  }

  // All execution paths have return statement
  max(a: int, b: int): int {
    if (a > b) {
      return a
    }
    return b
  }
}

function testValidMethodBodies(): void {
  let adder: Adder010 = new Adder010()
  let result: int = adder.compute(3, 5)
  let nm: string = adder.name()
  let ver: int = adder.version()

  let fmt: Formatter010 = new Formatter010()
  fmt.log("test")
  let m: int = fmt.max(10, 20)
}
