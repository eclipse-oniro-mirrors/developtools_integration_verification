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
 * @id CON_06_03_004_PASS_ADDITIVE_WIDENING
 * @expect compile-pass
 * @section 6.3
 * @design 加法/减法运算: int + long / long - int, widening 后运算
 * @note 正向用例：验证加法/减法运算的 widening 编译通过
 */
function testAdditiveWidening(): void {
  let a: int = 10
  let b: long = 20
  let r1: long = a + b
  let r2: long = b - a

  let c: int = 5
  let d: double = 3.14
  let r3: double = c + d
  let r4: double = d - c

  let e: byte = 10
  let f: int = 5
  let r5: int = e + f
}
