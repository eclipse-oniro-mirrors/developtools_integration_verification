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
 * @id TYP_03_06_03_019_RUNTIME_DIV_BY_ZERO_INF
 * @expect runtime
 * @section 3.6.3
 * @design 浮点除零不抛异常，而是产生 ±Infinity（与整数除零不同）
 * @note 运行时用例：spec §3.6.3 IEEE 754 行为
 */
function main(): void {
  let a: double = 5.0
  let b: double = 0.0

  // 5.0 / 0.0 = +Inf（不抛异常）
  let r1: double = a / b
  let posInf: double = 1.0 / 0.0
  if (r1 != posInf) {
    throw new Error("5.0/0.0 should be +Inf")
  }

  // -5.0 / 0.0 = -Inf
  let r2: double = -a / b
  let negInf: double = -1.0 / 0.0
  if (r2 != negInf) {
    throw new Error("-5.0/0.0 should be -Inf")
  }

  // 0.0 / 0.0 = NaN
  let r3: double = b / b
  if (r3 == r3) {
    throw new Error("0.0/0.0 should be NaN")
  }

  console.log("Float div by zero verified")
}