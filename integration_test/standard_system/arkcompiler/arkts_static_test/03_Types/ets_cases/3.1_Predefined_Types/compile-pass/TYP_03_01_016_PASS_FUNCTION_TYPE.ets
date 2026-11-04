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
 * @id TYP_03_01_016_PASS_FUNCTION_TYPE
 * @expect compile-pass
 * @section 3.1
 * @design 函数类型变量、带参函数类型、lambda 赋值、高阶函数
 * @note 正向用例：验证该特性编译通过的正确用法
 */
type IntOp = (x: int) => int

function applyOp(x: int, op: (x: int) => int): int {
  return op(x)
}

function testFunctionType(): void {
  let f1: () => int = (): int => { return 42 }
  let f2: (x: int) => int = (x: int): int => { return x * 2 }
  let f3: (a: int, b: int) => int = (a: int, b: int): int => { return a + b }

  let r1: int = f1()
  let r2: int = f2(21)
  let r3: int = f3(1, 2)

  let op: IntOp = (x: int): int => { return x + 1 }
  let result: int = applyOp(5, (x: int): int => { return x * x })
}