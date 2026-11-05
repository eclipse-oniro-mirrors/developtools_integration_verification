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
 * @id EXP2_17_12_021_RUNTIME_OVERRIDE_PRECEDENCE
 * @expect runtime
 * @section 17.12
 * @design 类重写接口默认方法，运行时验证重写的方法被调用而非默认实现
 * @note 运行时用例：验证方法重写优先于默认实现
 */
interface ICalculator {
  compute(x: int): int {
    return x * 2 // 默认：乘以2
  }
}

class Doubler implements ICalculator {
  // 不重写，使用默认
}

class Tripler implements ICalculator {
  // 重写：乘以3
  compute(x: int): int {
    return x * 3
  }
}

function main(): void {
  let d: Doubler = new Doubler()
  let t: Tripler = new Tripler()

  let r1: int = d.compute(10)
  if (r1 != 20) {
    throw new Error("FAIL: Doubler expected 20, got " + r1)
  }

  let r2: int = t.compute(10)
  if (r2 != 30) {
    throw new Error("FAIL: Tripler expected 30, got " + r2)
  }

  // 验证重写类不影响默认行为
  let r3: int = d.compute(5)
  if (r3 != 10) {
    throw new Error("FAIL: Doubler second call expected 10, got " + r3)
  }

  console.log('PASS: override takes precedence over default')
}
