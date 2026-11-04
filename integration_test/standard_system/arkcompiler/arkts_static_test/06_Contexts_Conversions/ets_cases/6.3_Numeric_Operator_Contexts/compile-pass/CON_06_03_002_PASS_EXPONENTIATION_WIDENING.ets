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
 * @id CON_06_03_002_PASS_EXPONENTIATION_WIDENING
 * @expect compile-pass
 * @section 6.3
 * @design 指数运算: int ** long, int widening 为 long 后运算
 * @note 正向用例：验证指数运算的 widening 编译通过
 */
function testExponentiationWidening(): void {
  let a: int = 2
  let b: long = 3
  let r1: double = a ** b

  let c: int = 5
  let r2: double = c ** 2
}
