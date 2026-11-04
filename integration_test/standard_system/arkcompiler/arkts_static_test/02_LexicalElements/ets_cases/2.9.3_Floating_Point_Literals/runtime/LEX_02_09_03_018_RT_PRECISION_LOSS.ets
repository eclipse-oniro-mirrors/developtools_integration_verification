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
 * @id LEX_02_09_03_018_RT_PRECISION_LOSS
 * @expect runtime
 * @section 2.9.3
 * @design 精度丢失验证
 * @note runtime 用例：验证浮点精度丢失问题
 */

function main(): void {
  // 验证浮点精度丢失
  let x1: double = 0.1 + 0.2
  // 0.1 + 0.2 !== 0.3 due to floating point precision
  let x2: double = 0.3
  let diff: double = x1 - x2
  // 差异应该非常小（接近 5.55e-17）
  if (diff > 0.0000000000000001 || diff < -0.0000000000000001) {
    throw new Error("0.1 + 0.2 - 0.3 should be very small, got " + diff)
  }

  // 验证 double 精度
  let x3: double = 1.0 / 3.0
  let x4: double = x3 * 3.0
  // 1/3 * 3 !== 1 exactly
  let diff2: double = x4 - 1.0
  if (diff2 > 0.0000000000000001 || diff2 < -0.0000000000000001) {
    throw new Error("1/3 * 3 should be close to 1, got " + x4)
  }
}
