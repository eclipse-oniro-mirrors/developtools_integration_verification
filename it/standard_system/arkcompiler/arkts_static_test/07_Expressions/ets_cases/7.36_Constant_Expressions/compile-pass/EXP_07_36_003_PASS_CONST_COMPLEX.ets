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
 * @id EXP_07_36_003_PASS_CONST_COMPLEX
 * @expect compile-pass
 * @section 7.36
 * @design 常量表达式：复杂运算组合
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
const A: int = 5
const B: int = 3
const SUM: int = A + B
const PROD: int = A * B
const COND: int = A > B ? A : B
const BIT: int = (A & B) | (A ^ B)
function testConstComplex(): void {
  console.log(SUM.toString(), PROD.toString(), COND.toString(), BIT.toString())
}
