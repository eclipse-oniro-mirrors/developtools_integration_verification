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
 * @id TYP_03_06_03_014_RUNTIME_INFINITY
 * @expect runtime
 * @section 3.6.3
 * @design ±Infinity 性质：1/0 = +Inf, -1/0 = -Inf
 * @note 运行时用例：spec §3.6.3 浮点上溢/特殊值
 */
function main(): void {
  let posInf: double = 1.0 / 0.0
  let negInf: double = -1.0 / 0.0

  // Infinity 大于任何有限值
  if (!(posInf > 1e308)) {
    throw new Error("+Infinity should be > 1e308")
  }
  if (!(negInf < -1e308)) {
    throw new Error("-Infinity should be < -1e308")
  }

  // Infinity 算术
  let r1: double = posInf + 1.0
  if (r1 != posInf) {
    throw new Error("+Inf + 1 should be +Inf")
  }

  let r2: double = posInf * 2.0
  if (r2 != posInf) {
    throw new Error("+Inf * 2 should be +Inf")
  }

  // Inf - Inf = NaN
  let r3: double = posInf - posInf
  if (r3 == r3) {
    throw new Error("+Inf - +Inf should be NaN")
  }

  console.log("Infinity properties verified")
}