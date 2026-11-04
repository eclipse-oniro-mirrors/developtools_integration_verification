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
 * @id LEX_02_05_048_RT_BIGINT_LITERALS
 * @expect runtime
 * @section 2.5
 * @design BigInt 字面量运行时验证
 * @note runtime 用例：验证 BigInt 字面量的运行时行为
 */

function main(): void {
  // BigInt 字面量
  let x1: bigint = 123n
  if (x1 !== 123n) { throw new Error("123n failed, got " + x1) }

  let x2: bigint = 0n
  if (x2 !== 0n) { throw new Error("0n failed, got " + x2) }

  let x3: bigint = -456n
  if (x3 !== -456n) { throw new Error("-456n failed, got " + x3) }

  // BigInt 运算
  let sum = x1 + x3
  if (sum !== -333n) { throw new Error("123 + (-456) failed, got " + sum) }

  // BigInt 转换
  let x4: bigint = BigInt("789")
  if (x4 !== 789n) { throw new Error("BigInt(\"789\") failed, got " + x4) }
}
