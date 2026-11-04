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
 * @id LEX_02_09_04_016_RT_BIGINT_CONVERSION_EDGE
 * @expect runtime
 * @section 2.9.4
 * @design BigInt 转换边界情况
 * @note runtime 用例：验证 BigInt() 转换的边界情况
 */

function main(): void {
  // 验证 BigInt("0")
  let x1: bigint = BigInt("0")
  if (x1 !== 0n) { throw new Error("BigInt(\"0\") failed, got " + x1) }

  // 验证 BigInt(0)
  let x2: bigint = BigInt(0)
  if (x2 !== 0n) { throw new Error("BigInt(0) failed, got " + x2) }

  // 验证 BigInt(-153)
  let x3: bigint = BigInt(-153)
  if (x3 !== -153n) { throw new Error("BigInt(-153) failed, got " + x3) }

  // 验证 BigInt("-153")
  let x4: bigint = BigInt("-153")
  if (x4 !== -153n) { throw new Error("BigInt(\"-153\") failed, got " + x4) }
}
