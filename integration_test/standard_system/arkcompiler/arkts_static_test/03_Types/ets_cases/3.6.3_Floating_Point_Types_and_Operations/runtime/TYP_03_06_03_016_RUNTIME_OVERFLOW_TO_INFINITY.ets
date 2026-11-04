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
 * @id TYP_03_06_03_016_RUNTIME_OVERFLOW_TO_INFINITY
 * @expect runtime
 * @section 3.6.3
 * @design 浮点上溢 → ±Infinity（spec §3.6.3）
 * @note 运行时用例：max * max → +Inf
 */
function main(): void {
  let maxD: double = 1.7976931348623157e308
  let overflow: double = maxD * 2.0
  let posInf: double = 1.0 / 0.0

  if (overflow != posInf) {
    throw new Error("max*2 should overflow to +Inf, got " + overflow)
  }

  let negOverflow: double = -maxD * 2.0
  let negInf: double = -1.0 / 0.0
  if (negOverflow != negInf) {
    throw new Error("-max*2 should overflow to -Inf")
  }

  console.log("Overflow to Infinity verified")
}