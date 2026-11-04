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
 * @id CON_06_03_003_PASS_MULTIPLICATIVE_WIDENING
 * @expect compile-pass
 * @section 6.3
 * @design 乘法运算: int * double / int * long, widening 后运算
 * @note 正向用例：验证乘法运算的 widening 编译通过
 */
function testMultiplicativeWidening(): void {
  let a: int = 10
  let b: double = 2.5
  let r1: double = a * b

  let c: int = 3
  let d: long = 100
  let r2: long = c * d

  let e: int = 7
  let f: double = 3.0
  let r3: double = e / f

  let g: int = 10
  let h: int = 3
  let r4: int = g % h
}
