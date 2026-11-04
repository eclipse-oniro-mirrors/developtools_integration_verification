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
 * @id STMT_08_05_012_PASS_complex_logical_operators
 * @expect compile-pass
 * @section 8.5
 * @design if 条件中使用复杂逻辑表达式 — && (逻辑与), || (逻辑或), ! (逻辑非) 运算符及其组合，括包与关系表达式混合
 * @note 正向用例：验证逻辑运算符在 if 条件中的编译支持，包含短路求值语义的结构
 */
function testComplexLogicalAnd(): void {
  let a: boolean = true
  let b: boolean = false
  if (a && b) { let r: int = 1 }
  if (a && a) { let r: int = 2 }
}

function testComplexLogicalOr(): void {
  let a: boolean = true
  let b: boolean = false
  if (a || b) { let r: int = 1 }
  if (b || b) { let r: int = 2 }
}

function testComplexLogicalNot(): void {
  let a: boolean = true
  let b: boolean = false
  if (!a) { let r: int = 1 }
  if (!b) { let r: int = 2 }
  if (!!a) { let r: int = 3 }
}

function testComplexMixedLogicalRelational(): void {
  let x: int = 5
  let y: int = 10
  if ((x > 0) && (y > 0)) { let r: int = 1 }
  if ((x < 0) || (y < 0)) { let r: int = 2 }
  if (!(x == y)) { let r: int = 3 }
  if ((x >= 5) && (y <= 10)) { let r: int = 4 }
  if ((x != y) || (x > y)) { let r: int = 5 }
}

function testComplexLogicalCombinations(): void {
  let a: boolean = true
  let b: boolean = false
  let x: int = 5
  let y: int = 10
  if ((a && b) || (!a && !b)) { let r: int = 1 }
  if (a && (x > 0) && (y > x)) { let r: int = 2 }
  if ((x > 0) || (b && a)) { let r: int = 3 }
  if (!((x > y) && (a || b))) { let r: int = 4 }
}
