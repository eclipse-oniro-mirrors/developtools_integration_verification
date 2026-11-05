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
 * @id LEX_02_09_04_021_RT_BIGINT_DIV_MOD
 * @expect runtime
 * @section 2.9.4
 * @design bigint 除法/取模运行时验证
 * @note runtime 用例：验证 bigint 除法/取模的运行时行为
 */

function main(): void {
  // bigint 除法
  let x1: bigint = 10n / 3n
  if (x1 !== 3n) { throw new Error("10n / 3n failed, got " + x1) }

  let x2: bigint = 100n / 10n
  if (x2 !== 10n) { throw new Error("100n / 10n failed, got " + x2) }

  // bigint 取模
  let x3: bigint = 10n % 3n
  if (x3 !== 1n) { throw new Error("10n % 3n failed, got " + x3) }

  let x4: bigint = 100n % 7n
  if (x4 !== 2n) { throw new Error("100n % 7n failed, got " + x4) }

  // 负数除法
  let x5: bigint = -10n / 3n
  if (x5 !== -3n) { throw new Error("-10n / 3n failed, got " + x5) }

  // 负数取模
  let x6: bigint = -10n % 3n
  if (x6 !== -1n) { throw new Error("-10n % 3n failed, got " + x6) }
}
