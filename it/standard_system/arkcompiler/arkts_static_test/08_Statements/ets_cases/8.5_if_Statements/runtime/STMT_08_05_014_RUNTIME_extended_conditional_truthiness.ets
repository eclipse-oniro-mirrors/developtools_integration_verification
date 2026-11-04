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
 * @id STMT_08_05_014_RUNTIME_extended_conditional_truthiness
 * @expect runtime
 * @section 8.5
 * @design 运行时验证 bigint, enum, null, undefined 作为 if 条件的 truthiness — Extended Conditional Expressions 完整覆盖
 * @note 运行时用例：验证 bigint(0n→falsy), enum(0→falsy), null(falsy), undefined(falsy) 的行为
 */
enum Color {
  RED,
  GREEN,
  BLUE
}

enum Status {
  NONE = 0,
  ACTIVE = 1,
  PENDING = 2
}

function main(): void {
  let r: int = 0

  // === bigint 条件 ===
  // 正 bigint: 1n → truthy
  r = 0
  let bp: bigint = 1n
  if (bp) { r = 1 }
  if (r != 1) { throw new Error("bigint 1n should be truthy") }

  // 零 bigint: 0n → falsy
  r = 0
  let bz: bigint = 0n
  if (bz) { r = 99 }
  if (r != 0) { throw new Error("bigint 0n should be falsy") }

  // !0n → truthy (else branch of !0n)
  r = 0
  if (!bz) { r = 2 }
  if (r != 2) { throw new Error("!bigint 0n should be truthy") }

  // 负 bigint: -1n → truthy
  r = 0
  let bn: bigint = -1n
  if (bn) { r = 3 }
  if (r != 3) { throw new Error("bigint -1n should be truthy") }

  // bigint 字面量: if (100n)
  r = 0
  if (100n) { r = 4 }
  if (r != 4) { throw new Error("if (100n) should execute then-branch") }

  // bigint 字面量: if (0n) → else
  r = 0
  if (0n) { r = 99 }
  else { r = 5 }
  if (r != 5) { throw new Error("if (0n) should execute else-branch") }

  // === enum 条件 ===
  // enum 默认值 0 (RED) → falsy
  r = 0
  let c1: Color = Color.RED
  if (c1) { r = 99 }
  if (r != 0) { throw new Error("enum Color.RED (0) should be falsy") }

  // enum 非 0 (GREEN=1) → truthy
  r = 0
  let c2: Color = Color.GREEN
  if (c2) { r = 6 }
  if (r != 6) { throw new Error("enum Color.GREEN (1) should be truthy") }

  // enum 非 0 (BLUE=2) → truthy
  r = 0
  let c3: Color = Color.BLUE
  if (c3) { r = 7 }
  if (r != 7) { throw new Error("enum Color.BLUE (2) should be truthy") }

  // enum 显式赋 0 (NONE) → falsy
  r = 0
  let s1: Status = Status.NONE
  if (s1) { r = 99 }
  if (r != 0) { throw new Error("enum Status.NONE (0) should be falsy") }

  // enum 显式赋 1 (ACTIVE) → truthy
  r = 0
  let s2: Status = Status.ACTIVE
  if (s2) { r = 8 }
  if (r != 8) { throw new Error("enum Status.ACTIVE (1) should be truthy") }

  // === null 条件 ===
  // null 变量 → falsy
  r = 0
  let n: null = null
  if (n) { r = 99 }
  if (r != 0) { throw new Error("null should be falsy") }

  // !null → truthy
  r = 0
  if (!n) { r = 9 }
  if (r != 9) { throw new Error("!null should be truthy") }

  // null 字面量 → falsy
  r = 0
  if (null) { r = 99 }
  if (r != 0) { throw new Error("if (null) should be falsy") }

  // === undefined 条件 ===
  // undefined 变量 → falsy
  r = 0
  let u: undefined = undefined
  if (u) { r = 99 }
  if (r != 0) { throw new Error("undefined should be falsy") }

  // !undefined → truthy
  r = 0
  if (!u) { r = 10 }
  if (r != 10) { throw new Error("!undefined should be truthy") }

  // undefined 字面量 → falsy
  r = 0
  if (undefined) { r = 99 }
  if (r != 0) { throw new Error("if (undefined) should be falsy") }

  // === 组合: null && undefined 均为 falsy ===
  r = 0
  if (n || u) { r = 99 }
  if (r != 0) { throw new Error("null || undefined should be falsy") }

  console.log("verified")
}
