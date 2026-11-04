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
 * @id STMT_08_05_014_PASS_enum_condition_extended
 * @expect compile-pass
 * @section 8.5
 * @design enum 类型作为 if 条件 — Extended Conditional Expressions 允许 enum (底层数值为 0 的成员 → false，其他 → true)
 * @note 正向用例：验证 enum 类型在 if 条件中的 Extended Conditional 语义编译通过
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

function testEnumCondition(): void {
  let c: Color = Color.RED
  if (c) { let x: int = 1 }
  let d: Color = Color.GREEN
  if (d) { let x: int = 2 }
}

function testEnumZeroCondition(): void {
  let c: Color = Color.RED
  if (!c) { let x: int = 1 }
}

function testEnumExplicitZeroCondition(): void {
  let s: Status = Status.NONE
  if (s) { let x: int = 1 }
  if (!s) { let x: int = 2 }
}

function testEnumNonZeroCondition(): void {
  let s1: Status = Status.ACTIVE
  if (s1) { let x: int = 1 }
  let s2: Status = Status.PENDING
  if (s2) { let x: int = 2 }
}

function testEnumLogicalNot(): void {
  let c: Color = Color.BLUE
  if (!c) { let x: int = 1 }
  if (!!c) { let x: int = 2 }
}
