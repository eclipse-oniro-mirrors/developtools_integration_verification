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
 * @id STMT_08_05_013_PASS_bigint_condition_extended
 * @expect compile-pass
 * @section 8.5
 * @design bigint 类型作为 if 条件 — Extended Conditional Expressions 允许 bigint (0n → false，非 0 → true)
 * @note 正向用例：验证 bigint 类型在 if 条件中的 Extended Conditional 语义编译通过
 */
function testBigintPositiveCondition(): void {
  let b1: bigint = 1n
  if (b1) { let x: int = 1 }
  let b2: bigint = 100n
  if (b2) { let x: int = 2 }
}

function testBigintZeroCondition(): void {
  let b1: bigint = 0n
  if (b1) { let x: int = 1 }
  if (!b1) { let x: int = 2 }
}

function testBigintNegativeCondition(): void {
  let b1: bigint = -1n
  if (b1) { let x: int = 1 }
  if (!b1) { let x: int = 2 }
}

function testBigintLiteralCondition(): void {
  if (0n) { let x: int = 1 }
  if (1n) { let x: int = 2 }
  if (-5n) { let x: int = 3 }
}

function testBigintLogicalNot(): void {
  let b: bigint = 0n
  if (!b) { let x: int = 1 }
  if (!!b) { let x: int = 2 }
}
