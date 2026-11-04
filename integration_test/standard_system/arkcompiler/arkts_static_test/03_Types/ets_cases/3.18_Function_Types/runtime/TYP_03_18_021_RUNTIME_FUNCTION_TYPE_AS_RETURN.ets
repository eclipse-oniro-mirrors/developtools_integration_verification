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
 * @id TYP_03_18_021_RUNTIME_FUNCTION_TYPE_AS_RETURN
 * @expect runtime
 * @section 3.18
 * @design 函数类型作为返回值（高阶函数）
 * @note 运行时用例：验证函数类型作为返回值的运行时行为
 *       注：double 是关键字，改用 multiplierTwo/multiplierThree
 */
type Transformer = (x: int) => int

function getIncrementer(): Transformer {
  return (x: int): int => { return x + 1 }
}

function getMultiplier(factor: int): (x: int) => int {
  return (x: int): int => { return x * factor }
}

function main(): void {
  let inc: Transformer = getIncrementer()
  if (inc(5) != 6) {
    throw new Error("inc(5) should be 6")
  }
  if (inc(0) != 1) {
    throw new Error("inc(0) should be 1")
  }

  let multiplierTwo: (x: int) => int = getMultiplier(2)
  let multiplierThree: (x: int) => int = getMultiplier(3)
  if (multiplierTwo(4) != 8) {
    throw new Error("multiplierTwo(4) should be 8")
  }
  if (multiplierThree(4) != 12) {
    throw new Error("multiplierThree(4) should be 12")
  }

  console.log("Function type as return verified")
}