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
 * @id EXP_07_32_02_001_PASS_ARITHMETIC_COMPOUND
 * @expect compile-pass
 * @section 7.32.2
 * @design 验证算术复合赋值运算符的编译通过：+=、-=、*=、/=、%= 在 int/long/float/double 四种数值类型上的使用
 * @note 正向用例：每种算术复合运算符在 int/long/float/double 上使用，验证 l op= r 形式的编译通过。long 使用 int 字面量不扩宽
 */
function main(): void {
  // === int 类型算术复合 ===
  let a: int = 10;
  a += 5;
  a -= 3;
  a *= 2;
  a /= 4;
  a %= 3;

  // === long 类型算术复合 ===
  let b: long = 100;
  b += 50;
  b -= 20;
  b *= 2;
  b /= 3;
  b %= 7;

  // === float 类型算术复合 ===
  let c: float = 10.0f;
  c += 5.5f;
  c -= 2.0f;
  c *= 3.0f;
  c /= 4.0f;
  c %= 3.0f;

  // === double 类型算术复合 ===
  let d: double = 100.0;
  d += 50.5;
  d -= 20.0;
  d *= 2.0;
  d /= 3.0;
  d %= 7.0;

  console.log('verified');
}
