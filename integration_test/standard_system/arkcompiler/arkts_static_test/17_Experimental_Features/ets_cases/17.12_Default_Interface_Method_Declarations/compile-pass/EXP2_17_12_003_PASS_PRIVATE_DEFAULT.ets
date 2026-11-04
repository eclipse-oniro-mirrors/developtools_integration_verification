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
 * @id EXP2_17_12_003_PASS_PRIVATE_DEFAULT
 * @expect compile-pass
 * @section 17.12
 * @design 接口中声明私有默认方法，在公开的默认方法中调用该私有方法，类实现接口并调用公开默认方法
 * @note 正向用例：验证私有默认方法在接口内部的调用链
 */
interface IMath {
  compute(a: int, b: int): int {
    return this.add(a, b)
  }

  multiply(a: int, b: int): int {
    let result: int = 0
    for (let i: int = 0; i < b; i++) {
      result = this.add(result, a)
    }
    return result
  }

  private add(a: int, b: int): int {
    return a + b
  }

  private subtract(a: int, b: int): int {
    return a - b
  }
}

class Calculator implements IMath {
}

function main(): void {
  let c: Calculator = new Calculator()
  let s: int = c.compute(3, 4)
  let m: int = c.multiply(3, 5)
  console.log("sum=" + s + ', product=' + m)
}
