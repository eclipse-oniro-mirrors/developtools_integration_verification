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
 * @id LEX_02_09_01_031_RT_BIGINT_NEGATIVE
 * @expect runtime
 * @section 2.9.1
 * @design 负数 bigint 运算验证
 * @note runtime 用例：验证负数 bigint 运算
 */

function main(): void {
  // 验证负数 bigint 运算
  let x1: bigint = -123n
  let x2: bigint = 456n
  let sum: bigint = x1 + x2
  if (sum !== 333n) { throw new Error("-123 + 456 failed, got " + sum) }

  // 验证负数 bigint 乘法
  let product: bigint = x1 * x2
  if (product !== -56088n) { throw new Error("-123 * 456 failed, got " + product) }

  // 验证负数 bigint 比较
  if (!(x1 < x2)) { throw new Error("-123 < 456 failed") }
}
