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
 * @id EXP_07_35_03_007_PASS_LAMBDA_AS_PARAM_RETURN
 * @expect compile-pass
 * @section 7.35.3
 * @design 验证 Lambda 表达式作为函数参数和返回类型（高阶函数）的类型正确性
 * @note 正向用例：lambda 作为函数参数/返回类型编译通过
 */

// 函数类型别名
type IntBinaryOp = (x: int, y: int) => int
type IntUnaryOp = (x: int) => int

// 高阶函数：参数为函数类型
function applyOp(a: int, b: int, op: IntBinaryOp): int {
  return op(a, b)
}

// 高阶函数：返回值为函数类型
function makeAdder(base: int): IntUnaryOp {
  return (x: int): int => x + base
}

// 函数返回推断 lambda（非 double 关键字）
function makeTimes(factor: int): (x: int) => int {
  return (x: int) => x * factor
}

function main(): void {
  // Lambda 作为参数
  let sum: int = applyOp(10, 20, (x: int, y: int): int => x + y)
  let diff: int = applyOp(10, 20, (x: int, y: int): int => x - y)

  // Lambda 作为返回类型
  let add5: IntUnaryOp = makeAdder(5)
  let r1: int = add5(10)

  // 推断 lambda 作为返回类型
  let timesTwo: (x: int) => int = makeTimes(2)
  let r2: int = timesTwo(21)

  // 类型别名定义函数类型
  let mul: IntBinaryOp = (x: int, y: int): int => x * y
  let r3: int = mul(6, 7)

  console.log('' + sum + diff + r1 + r2 + r3)
}
