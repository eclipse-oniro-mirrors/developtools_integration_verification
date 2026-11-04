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
 * @id LEX_02_09_04_020_RT_ZERO_BIGINT
 * @expect runtime
 * @section 2.9.4
 * @design 零 bigint 运行时验证
 * @note runtime 用例：验证零 bigint 的运行时行为
 */

function main(): void {
  // 零 bigint
  let x1: bigint = 0n
  if (x1 !== 0n) { throw new Error("0n failed, got " + x1) }

  let x2: bigint = -0n
  if (x2 !== 0n) { throw new Error("-0n failed, got " + x2) }

  // 零 bigint 运算
  let x3: bigint = 0n + 123n
  if (x3 !== 123n) { throw new Error("0n + 123n failed, got " + x3) }

  let x4: bigint = 0n * 999n
  if (x4 !== 0n) { throw new Error("0n * 999n failed, got " + x4) }

  // 验证 -0n === 0n
  if (x1 !== x2) { throw new Error("0n !== -0n") }
}
