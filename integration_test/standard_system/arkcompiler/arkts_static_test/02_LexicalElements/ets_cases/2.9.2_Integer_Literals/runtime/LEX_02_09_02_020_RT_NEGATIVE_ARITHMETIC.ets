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
 * @id LEX_02_09_02_020_RT_NEGATIVE_ARITHMETIC
 * @expect runtime
 * @section 2.9.2
 * @design 负整数运算验证
 * @note runtime 用例：验证负整数运算正确性
 */

function main(): void {
  // 验证负整数加法
  let x1: int = -42
  let x2: int = 100
  let sum: int = x1 + x2
  if (sum !== 58) { throw new Error("-42 + 100 failed, got " + sum) }

  // 验证负整数乘法
  let product: int = x1 * x2
  if (product !== -4200) { throw new Error("-42 * 100 failed, got " + product) }

  // 验证负整数除法
  let div: int = -100 / 10
  if (div !== -10) { throw new Error("-100 / 10 failed, got " + div) }

  // 验证负整数取模
  let mod: int = -103 % 10
  if (mod !== -3) { throw new Error("-103 % 10 failed, got " + mod) }
}
