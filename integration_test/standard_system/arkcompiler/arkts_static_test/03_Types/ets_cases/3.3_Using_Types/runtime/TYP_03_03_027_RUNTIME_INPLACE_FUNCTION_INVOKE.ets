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
 * @id TYP_03_03_027_RUNTIME_INPLACE_FUNCTION_INVOKE
 * @expect runtime
 * @section 3.3
 * @design 就地函数类型变量的调用、作为参数传递
 * @note 运行时用例：验证就地函数类型运行时调用
 */
function applyOp(x: int, op: (n: int) => int): int {
  return op(x)
}

function main(): void {
  // 就地函数类型变量
  let square: (n: int) => int = (n: int): int => { return n * n }
  let r1: int = square(5)
  if (r1 != 25) {
    throw new Error("square(5) should be 25")
  }

  // 就地函数类型作为参数
  let r2: int = applyOp(7, (n: int): int => { return n + 100 })
  if (r2 != 107) {
    throw new Error("applyOp(7, +100) should be 107")
  }

  // 多参函数
  let add: (a: int, b: int) => int = (a: int, b: int): int => { return a + b }
  if (add(3, 4) != 7) {
    throw new Error("add(3,4) should be 7")
  }

  console.log("Inplace function invoke verified")
}