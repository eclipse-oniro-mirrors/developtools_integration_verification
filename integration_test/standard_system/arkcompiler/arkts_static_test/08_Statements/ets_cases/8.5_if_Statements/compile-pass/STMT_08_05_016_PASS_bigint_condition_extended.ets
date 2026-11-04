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
 * @id STMT_08_05_016_PASS_bigint_condition_extended
 * @expect compile-pass
 * @section 8.5
 * @design bigint 类型作为 if 条件的 Extended Conditional 语义补充 — 覆盖 if 无 else 分支、if-else-if 链、no-block if 等未覆盖模式
 * @note 正向用例：bigint 0n 为 falsy（then 跳过），非 0n 为 truthy（then 执行）；补充 if-without-else 和 no-block 模式
 */
function testBigintIfWithoutElse(): void {
  let b1: bigint = 1n
  if (b1) { let x: int = 1 }
  let b2: bigint = 0n
  if (b2) { let x: int = 99 }
  let b3: bigint = -1n
  if (b3) { let x: int = 2 }
}

function testBigintIfElseIfChain(): void {
  let v: bigint = 2n
  if (v == 0n) {
    let x: int = 1
  } else if (v == 1n) {
    let x: int = 2
  } else if (v == 2n) {
    let x: int = 3
  }
}

function testBigintNoBlockIf(): void {
  let b: bigint = 5n
  let r: int = 0
  if (b) r = 1
  let z: bigint = 0n
  if (z) r = 99
}

function testBigintComparisonLiteral(): void {
  if (0n) { let x: int = 99 }
  if (1n) { let x: int = 1 }
  if (-10n) { let x: int = 2 }
  if (9999999999999999n) { let x: int = 3 }
}
