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
 * @id LEX_02_09_01_043_RT_NEGATIVE_LITERALS
 * @expect runtime
 * @section 2.9.1
 * @design 负数字面量运行时验证
 * @note runtime 用例：验证负数字面量的运行时行为
 */

function main(): void {
  // 负整数
  let x1 = -42
  if (x1 !== -42) { throw new Error("-42 failed, got " + x1) }

  // 负十六进制
  let x2 = -0xFF
  if (x2 !== -255) { throw new Error("-0xFF failed, got " + x2) }

  // 负浮点
  let x3 = -3.14
  if (x3 !== -3.14) { throw new Error("-3.14 failed, got " + x3) }

  // 负科学计数法
  let x4 = -1e10
  if (x4 !== -10000000000) { throw new Error("-1e10 failed, got " + x4) }

  // 负 BigInt
  let x5 = -123n
  if (x5 !== -123n) { throw new Error("-123n failed, got " + x5) }

  // 负数运算
  let x6 = -10 + 5
  if (x6 !== -5) { throw new Error("-10 + 5 failed, got " + x6) }
}
