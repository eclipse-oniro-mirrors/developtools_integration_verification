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
 * @id LEX_02_09_01_028_RT_BIGINT_FUNCTION
 * @expect runtime
 * @section 2.9.1
 * @design BigInt() 函数验证
 * @note runtime 用例：验证 BigInt() 转换函数
 */

function main(): void {
  // 验证 BigInt(string) 函数
  let x1: bigint = BigInt("123")
  if (x1 !== 123n) { throw new Error("BigInt(\"123\") failed, got " + x1) }

  // 验证 BigInt(long) 函数
  let x2: bigint = BigInt(123)
  if (x2 !== 123n) { throw new Error("BigInt(123) failed, got " + x2) }

  // 验证 BigInt("0")
  let x3: bigint = BigInt("0")
  if (x3 !== 0n) { throw new Error("BigInt(\"0\") failed, got " + x3) }

  // 验证 BigInt(0)
  let x4: bigint = BigInt(0)
  if (x4 !== 0n) { throw new Error("BigInt(0) failed, got " + x4) }

  // 验证负数转换
  let x5: bigint = BigInt("-456")
  if (x5 !== -456n) { throw new Error("BigInt(\"-456\") failed, got " + x5) }
}
