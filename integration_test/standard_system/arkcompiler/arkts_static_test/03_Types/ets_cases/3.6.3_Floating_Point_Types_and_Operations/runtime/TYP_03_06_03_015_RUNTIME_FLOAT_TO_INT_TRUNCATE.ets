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
 * @id TYP_03_06_03_015_RUNTIME_FLOAT_TO_INT_TRUNCATE
 * @expect runtime
 * @section 3.6.3
 * @design 浮点 → 整数 round-toward-zero（截断）
 * @note 运行时用例：spec §3.6.3 截断规则
 */
function main(): void {
  // 正数：3.7 → 3
  let pos: double = 3.7
  if (pos.toInt() != 3) {
    throw new Error("3.7.toInt() should be 3")
  }

  // 负数：-3.7 → -3（toward zero）
  let neg: double = -3.7
  if (neg.toInt() != -3) {
    throw new Error("-3.7.toInt() should be -3")
  }

  // 边界：3.0 → 3
  let exact: double = 3.0
  if (exact.toInt() != 3) {
    throw new Error("3.0.toInt() should be 3")
  }

  // 接近 0
  let small: double = 0.999
  if (small.toInt() != 0) {
    throw new Error("0.999.toInt() should be 0")
  }

  let smallNeg: double = -0.999
  if (smallNeg.toInt() != 0) {
    throw new Error("-0.999.toInt() should be 0")
  }

  console.log("Round-toward-zero verified")
}