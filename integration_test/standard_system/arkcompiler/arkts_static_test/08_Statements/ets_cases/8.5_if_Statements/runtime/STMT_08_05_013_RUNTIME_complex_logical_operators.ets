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
 * @id STMT_08_05_013_RUNTIME_complex_logical_operators
 * @expect runtime
 * @section 8.5
 * @design 运行时验证 if 条件中逻辑运算符 &&, ||, ! 的短路求值和真值表行为
 * @note 运行时用例：验证逻辑与/或/非及混合组合的正确执行分支
 */
function main(): void {
  let a: boolean = true
  let b: boolean = false
  let r: int = 0

  // 逻辑与 &&: true && true → then
  r = 0
  if (a && true) { r = 1 }
  if (r != 1) { throw new Error("true && true should execute then-branch") }

  // 逻辑与 &&: true && false → else
  r = 0
  if (a && b) { r = 99 }
  else { r = 2 }
  if (r != 2) { throw new Error("true && false should execute else-branch") }

  // 逻辑与 &&: false && true → else (短路)
  r = 0
  if (b && a) { r = 99 }
  else { r = 3 }
  if (r != 3) { throw new Error("false && true should execute else-branch (short-circuit)") }

  // 逻辑或 ||: false || true → then
  r = 0
  if (b || a) { r = 4 }
  if (r != 4) { throw new Error("false || true should execute then-branch") }

  // 逻辑或 ||: false || false → else
  r = 0
  if (b || false) { r = 99 }
  else { r = 5 }
  if (r != 5) { throw new Error("false || false should execute else-branch") }

  // 逻辑或 ||: true || false → then (短路)
  r = 0
  if (a || b) { r = 6 }
  if (r != 6) { throw new Error("true || false should execute then-branch (short-circuit)") }

  // 逻辑非 !: !false → then
  r = 0
  if (!b) { r = 7 }
  if (r != 7) { throw new Error("!false should be truthy") }

  // 逻辑非 !: !true → else
  r = 0
  if (!a) { r = 99 }
  else { r = 8 }
  if (r != 8) { throw new Error("!true should be falsy") }

  // 双重非 !!: !!true → then
  r = 0
  if (!!a) { r = 9 }
  if (r != 9) { throw new Error("!!true should be truthy") }

  // 混合: (true && false) || true → then
  r = 0
  if ((a && b) || a) { r = 10 }
  if (r != 10) { throw new Error("(true && false) || true should be truthy") }

  // 混合: (true || false) && false → else
  r = 0
  if ((a || b) && b) { r = 99 }
  else { r = 11 }
  if (r != 11) { throw new Error("(true || false) && false should be falsy") }

  // 关系+逻辑混合: (x > 0) && (y > 0)
  let x: int = 5
  let y: int = 10
  r = 0
  if ((x > 0) && (y > 0)) { r = 12 }
  if (r != 12) { throw new Error("(5 > 0) && (10 > 0) should be truthy") }

  // 关系+逻辑混合: (x < 0) || (y > 0)
  r = 0
  if ((x < 0) || (y > 0)) { r = 13 }
  if (r != 13) { throw new Error("(5 < 0) || (10 > 0) should be truthy") }

  // 关系+逻辑混合: !(x == y)
  r = 0
  if (!(x == y)) { r = 14 }
  if (r != 14) { throw new Error("!(5 == 10) should be truthy") }

  // 三层组合: a && x > 0 && y > x
  r = 0
  if (a && (x > 0) && (y > x)) { r = 15 }
  if (r != 15) { throw new Error("a && (x > 0) && (y > x) should be truthy") }

  console.log("verified")
}
