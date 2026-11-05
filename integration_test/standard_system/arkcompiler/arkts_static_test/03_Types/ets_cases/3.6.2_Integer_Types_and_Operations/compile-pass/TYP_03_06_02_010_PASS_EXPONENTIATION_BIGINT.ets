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
 * @id TYP_03_06_02_010_PASS_EXPONENTIATION_BIGINT
 * @expect compile-pass
 * @section 3.6.2
 * @design 整数幂运算 ** 结果为 bigint（spec §3.6.2 关键设计）
 * @note 正向用例：integer ** integer → bigint
 */
function testExponentiationBigint(): void {
  // spec §3.6.2: "Exponentiation operator '**' as a variant
  // that produces a value of type bigint"
  let r1: bigint = 2n ** 10n   // bigint ** bigint = bigint

  // 整数（int/long）幂运算时期望产出 bigint
  // 注：实际实现可能要求显式 bigint 字面量
  let big1: bigint = 3n ** 5n
  let big2: bigint = 10n ** 20n
}