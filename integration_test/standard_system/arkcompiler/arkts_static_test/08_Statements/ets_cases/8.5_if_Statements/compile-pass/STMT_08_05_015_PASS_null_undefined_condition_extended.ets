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
 * @id STMT_08_05_015_PASS_null_undefined_condition_extended
 * @expect compile-pass
 * @section 8.5
 * @design null 和 undefined 类型作为 if 条件 — Extended Conditional Expressions 允许 null 和 undefined (均为 falsy)
 * @note 正向用例：验证 null 和 undefined 在 if 条件中的 Extended Conditional 语义编译通过
 */
function testNullConditionVariable(): void {
  let n: null = null
  if (n) { let x: int = 1 }
  if (!n) { let x: int = 2 }
}

function testNullConditionLiteral(): void {
  if (null) { let x: int = 1 }
  if (!null) { let x: int = 2 }
}

function testUndefinedConditionVariable(): void {
  let u: undefined = undefined
  if (u) { let x: int = 1 }
  if (!u) { let x: int = 2 }
}

function testUndefinedConditionLiteral(): void {
  if (undefined) { let x: int = 1 }
  if (!undefined) { let x: int = 2 }
}

function testNullUndefinedComparison(): void {
  let n: null = null
  let u: undefined = undefined
  if (n) { let x: int = 1 }
  if (u) { let x: int = 2 }
  if (!n && !u) { let x: int = 3 }
}

function testNullableUnionCondition(): void {
  let v: number | null = null
  if (v) { let x: int = 1 }
  if (!v) { let x: int = 2 }
  let w: string | undefined = undefined
  if (w) { let x: int = 3 }
  if (!w) { let x: int = 4 }
}
