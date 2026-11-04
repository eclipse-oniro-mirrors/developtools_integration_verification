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
 * @id TYP_03_06_03_005_PASS_EXPONENTIATION_DOUBLE
 * @expect compile-pass
 * @section 3.6.3
 * @design 浮点幂运算 ** 结果总是 double（spec §3.6.3 64-bit 精度）
 * @note 正向用例：浮点 ** 浮点 → double
 */
function testExponentiationDouble(): void {
  let f: float = 2.0f
  let d: double = 3.0

  let r1: double = f ** 2.0   // float ** double → double
  let r2: double = d ** 2.0   // double ** double → double
  let r3: double = 2.0 ** f   // double ** float → double
  let r4: double = 2.0 ** 10.0
}