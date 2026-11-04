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
 * @id EXP2_17_11_2_014_RUNTIME_FINAL_METHOD_RETURN
 * @expect runtime
 * @section 17.11.2
 * @design final 方法返回值计算验证：验证 final 方法的计算逻辑在运行时正确执行
 * @note 运行时用例：验证 final 方法的复杂计算和返回值
 */
class MathOps {
  final square(x: int): int {
    return x * x
  }

  final sumOfSquares(a: int, b: int): int {
    return this.square(a) + this.square(b)
  }

  final isEven(n: int): boolean {
    return (n % 2) == 0
  }
}

function main(): void {
  let m: MathOps = new MathOps()

  if (m.square(5) != 25) {
    throw new Error('assertion failed: 5^2 should be 25')
  }
  if (m.square(0) != 0) {
    throw new Error('assertion failed: 0^2 should be 0')
  }
  if (m.square(-3) != 9) {
    throw new Error('assertion failed: (-3)^2 should be 9')
  }

  if (m.sumOfSquares(3, 4) != 25) {
    throw new Error('assertion failed: 3^2 + 4^2 should be 25')
  }

  if (m.isEven(4) != true) {
    throw new Error('assertion failed: 4 should be even')
  }
  if (m.isEven(7) != false) {
    throw new Error('assertion failed: 7 should be odd')
  }

  console.log('verified')
}
