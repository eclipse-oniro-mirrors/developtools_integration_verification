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
 * @id EXP_07_32_02_005_FAIL_NULLISH_COALESCING_UNSUPPORTED
 * @expect compile-fail
 * @section 7.32.2
 * @design 验证 ??= (Nullish Coalescing Assignment) 的编译行为。Spec 定义 ??= 运算符语义，但编译器不支持（Syntax error ESY0227）
 * @note ⚠️ SPEC 不一致：Spec 中 7.32.2 显式声明 "??= only evaluates the right operand, and assigns to the left operand if the
 *       left operand is null or undefined"，但当前编译器不支持 `??=` 语法，报 ESY0227 Unexpected token '??='
 */

// 使用可空类型的 ??=
function testNullAssign(): void {
  let a: int | null = null;
  a ??= 42;    // Syntax error: ESY0227 — Unexpected token '??='

  let b: int | null = 10;
  b ??= 99;    // 同上
}

function testUndefinedAssign(): void {
  let a: int | undefined = undefined;
  a ??= 42;

  let b: int | undefined = 10;
  b ??= 99;
}

function testStringNullish(): void {
  let s: string | null = null;
  s ??= 'default';

  let t: string | undefined = undefined;
  t ??= 'fallback';
}

function main(): void {
  testNullAssign();
  testUndefinedAssign();
  testStringNullish();

  // 内联 ??= 使用
  let x: int | null = null;
  x ??= 100;
  x ??= 200;

  console.log('verified');
}
