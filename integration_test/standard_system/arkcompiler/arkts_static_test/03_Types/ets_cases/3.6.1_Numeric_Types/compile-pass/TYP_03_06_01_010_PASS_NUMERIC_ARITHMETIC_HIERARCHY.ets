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
 * @id TYP_03_06_01_010_PASS_NUMERIC_ARITHMETIC_HIERARCHY
 * @expect compile-pass
 * @section 3.6.1
 * @design 数值类型层次内的算术运算（混合类型自动 widening）
 * @note 正向用例：byte+int=int, int+long=long, long+float=float, float+double=double
 */
function testNumericArithmeticHierarchy(): void {
  let b: byte = 1
  let s: short = 2
  let i: int = 3
  let l: long = 4
  let f: float = 5.0f
  let d: double = 6.0

  // byte + int → int
  let r1: int = b + i

  // short + long → long
  let r2: long = s + l

  // int + float → float
  let r3: float = i + f

  // long + double → double
  let r4: double = l + d

  // float + double → double
  let r5: double = f + d
}