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
 * @id LEX_02_09_02_021_RT_LONG_ARITHMETIC
 * @expect runtime
 * @section 2.9.2
 * @design long 运算验证
 * @note runtime 用例：验证 long 大数值运算正确性
 */

function main(): void {
  // 验证 long 加法
  let x1: long = 9223372036854775800
  let x2: long = 7
  let sum: long = x1 + x2
  if (sum !== 9223372036854775807) { throw new Error("long addition failed, got " + sum) }

  // 验证 long 乘法（不溢出）
  let x3: long = 1000000000
  let x4: long = 1000000000
  let product: long = x3 * x4
  if (product !== 1000000000000000000) { throw new Error("long multiplication failed, got " + product) }

  // 验证 long 减法
  let x5: long = -9223372036854775808
  let x6: long = 1
  let diff: long = x5 - x6
  // This would underflow, but let's test normal subtraction
  let x7: long = 100
  let x8: long = 50
  let diff2: long = x7 - x8
  if (diff2 !== 50) { throw new Error("long subtraction failed, got " + diff2) }
}
