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
 * @id TYP_03_18_019_RUNTIME_FUNCTION_TYPE_INVOKE
 * @expect runtime
 * @section 3.18
 * @design 函数类型变量声明、赋值、调用、type 别名
 * @note 运行时用例：验证函数类型变量的运行时行为
 */
type IntBinOp = (a: int, b: int) => int

function main(): void {
  let add: IntBinOp = (a: int, b: int): int => { return a + b }
  let mul: IntBinOp = (a: int, b: int): int => { return a * b }

  if (add(3, 4) != 7) {
    throw new Error("add(3, 4) should be 7")
  }
  if (mul(3, 4) != 12) {
    throw new Error("mul(3, 4) should be 12")
  }

  let negate: (x: int) => int = (x: int): int => { return -x }
  if (negate(5) != -5) {
    throw new Error("negate(5) should be -5")
  }

  let greet: () => string = (): string => { return "hello" }
  if (greet() != "hello") {
    throw new Error("greet() should be 'hello'")
  }

  console.log("Function type invoke verified")
}