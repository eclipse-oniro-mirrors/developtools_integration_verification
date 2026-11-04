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
 * @id TYP_03_18_002_PASS_FUNCTION_TYPE_AS_PARAM
 * @expect compile-pass
 * @section 3.18
 * @design 函数类型作为参数传递
 * @note 正向用例：验证函数类型作为函数参数
 */
type MathOp = (a: int, b: int) => int

function apply(a: int, b: int, op: MathOp): int {
  return op(a, b)
}

function evaluate(f: (x: number, y: number) => number): number {
  return f(1.0, 2.0)
}

function testFunctionTypeAsParam(): void {
  let add: MathOp = (a: int, b: int): int => { return a + b }
  let r1: int = apply(3, 4, add)
  let r2: int = apply(10, 2, (a: int, b: int): int => { return a * b })
  let r3: number = evaluate((x: number, y: number): number => { return x + y })
}