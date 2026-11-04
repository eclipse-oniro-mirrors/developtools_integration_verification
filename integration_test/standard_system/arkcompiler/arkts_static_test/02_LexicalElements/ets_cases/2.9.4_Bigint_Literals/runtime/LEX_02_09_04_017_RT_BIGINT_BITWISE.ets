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
 * @id LEX_02_09_04_017_RT_BIGINT_BITWISE
 * @expect runtime
 * @section 2.9.4
 * @design bigint 位运算验证
 * @note runtime 用例：验证 bigint 位运算
 */

function main(): void {
  // 验证 bigint 位运算（使用十进制）
  let x: bigint = 255n  // 0xFF
  let y: bigint = 15n   // 0x0F
  
  // AND 运算
  let andResult: bigint = x & y
  if (andResult !== 15n) { throw new Error("bigint AND failed, got " + andResult) }
  
  // OR 运算
  let orResult: bigint = x | 256n  // 0x100
  if (orResult !== 511n) { throw new Error("bigint OR failed, got " + orResult) }
  
  // XOR 运算
  let xorResult: bigint = x ^ 255n
  if (xorResult !== 0n) { throw new Error("bigint XOR failed, got " + xorResult) }
}
