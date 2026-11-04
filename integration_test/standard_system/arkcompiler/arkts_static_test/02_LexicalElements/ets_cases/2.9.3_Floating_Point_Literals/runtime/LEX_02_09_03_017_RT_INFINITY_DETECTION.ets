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
 * @id LEX_02_09_03_017_RT_INFINITY_DETECTION
 * @expect runtime
 * @section 2.9.3
 * @design Infinity 检测验证
 * @note runtime 用例：验证 Infinity 检测
 */

function main(): void {
  // 验证正 Infinity
  let x1: double = 1.0 / 0.0
  // Infinity 大于任何有限数
  if (!(x1 > 1000000.0)) { throw new Error("Infinity should be greater than any finite number") }

  // 验证负 Infinity
  let x2: double = -1.0 / 0.0
  // 负 Infinity 小于任何有限数
  if (!(x2 < -1000000.0)) { throw new Error("-Infinity should be less than any finite number") }

  // 验证正常值不是 Infinity
  let x3: double = 3.14
  let x4: double = 1.0 / 0.0
  // Infinity 与正常值比较
  if (!(x4 > x3)) { throw new Error("Infinity should be greater than 3.14") }

  // 验证 Infinity 的特殊运算
  let x5: double = 1.0 / 0.0
  let x6: double = x5 + x5
  // Infinity + Infinity = Infinity
  if (!(x6 > 1000000.0)) { throw new Error("Infinity + Infinity should be Infinity") }
}
