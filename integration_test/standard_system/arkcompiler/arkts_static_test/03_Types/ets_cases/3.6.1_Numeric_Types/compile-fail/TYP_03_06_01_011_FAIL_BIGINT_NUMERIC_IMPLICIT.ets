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
 * @id TYP_03_06_01_011_FAIL_BIGINT_NUMERIC_IMPLICIT
 * @expect compile-fail
 * @section 3.6.1
 * @design bigint 不在数值类型层次中，无隐式转换
 * @note 反向用例：spec §3.6.1 "No implicit conversion from numeric types to bigint"
 */
function testBigintNumericImplicitFail(): void {
  // int → bigint 隐式转换应失败
  let i: int = 100
  let big: bigint = i

  // bigint → number 隐式转换应失败
  let big2: bigint = 200n
  let n: number = big2

  // bigint 与 int 算术运算应失败
  let mix: bigint = 100n + 1
}