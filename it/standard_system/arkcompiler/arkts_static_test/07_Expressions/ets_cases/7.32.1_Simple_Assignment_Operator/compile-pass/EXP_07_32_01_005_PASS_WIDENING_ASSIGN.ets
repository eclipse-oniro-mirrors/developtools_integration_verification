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
 * @id EXP_07_32_01_005_PASS_WIDENING_ASSIGN
 * @expect compile-pass
 * @section 7.32.1
 * @design 验证隐式扩宽赋值的编译通过：byte→int→long→float→double 的扩宽链
 * @note 正向用例：验证窄类型可隐式扩宽赋值给宽类型。byte 和 short 没有字面量后缀，使用 int 字面量
 */
function main(): void {
  let b: byte = 10;
  let sh: short = 20;
  let i: int = 0;
  let l: long = 0;
  let f: float = 0.0f;
  let d: double = 0.0;

  // byte → int
  i = b;

  // byte → long
  l = b;

  // byte → float
  f = b;

  // byte → double
  d = b;

  // short → int
  i = sh;

  // short → long
  l = sh;

  // short → float
  f = sh;

  // short → double
  d = sh;

  // int → long
  l = i;

  // int → float
  f = i;

  // int → double
  d = i;

  // long → float
  f = l;

  // long → double
  d = l;

  // float → double
  d = f;

  console.log('verified');
}
