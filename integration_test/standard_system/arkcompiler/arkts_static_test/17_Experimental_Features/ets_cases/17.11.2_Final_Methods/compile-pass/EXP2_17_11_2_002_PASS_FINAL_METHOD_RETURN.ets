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
 * @id EXP2_17_11_2_002_PASS_FINAL_METHOD_RETURN
 * @expect compile-pass
 * @section 17.11.2
 * @design final 方法带参数和返回值：验证 final 方法可以有参数和返回值
 * @note 正向用例：验证 final 方法支持参数传递和返回值
 */
class Calculator {
  final add(a: int, b: int): int {
    return a + b
  }

  final multiply(a: int, b: int): int {
    return a * b
  }
}

function testFinalMethodReturn(): void {
  let calc: Calculator = new Calculator()
  let sum: int = calc.add(3, 5)
  let prod: int = calc.multiply(4, 6)
  console.log(sum)
  console.log(prod)
}
