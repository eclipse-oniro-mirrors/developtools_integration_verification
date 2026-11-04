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
 * @id LEX_02_09_03_023_RT_NEGATIVE_FLOATS
 * @expect runtime
 * @section 2.9.3
 * @design 负浮点数运行时验证
 * @note runtime 用例：验证负浮点数的运行时行为
 */

function main(): void {
  // 负浮点数
  let x1 = -3.14
  if (x1 !== -3.14) { throw new Error("-3.14 failed, got " + x1) }

  let x2 = -0.5
  if (x2 !== -0.5) { throw new Error("-0.5 failed, got " + x2) }

  let x3 = -.5
  if (x3 !== -0.5) { throw new Error("-.5 failed, got " + x3) }

  let x4 = -1e10
  if (x4 !== -10000000000) { throw new Error("-1e10 failed, got " + x4) }

  let x5 = -1.5e-5
  if (x5 !== -0.000015) { throw new Error("-1.5e-5 failed, got " + x5) }

  // 负浮点运算
  let x6 = -3.14 + 1.14
  if (x6 !== -2.0) { throw new Error("-3.14 + 1.14 failed, got " + x6) }
}
