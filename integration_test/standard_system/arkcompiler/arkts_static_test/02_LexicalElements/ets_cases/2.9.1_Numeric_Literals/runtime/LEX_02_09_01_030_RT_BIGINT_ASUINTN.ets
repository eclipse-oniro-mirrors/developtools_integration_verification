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
 * @id LEX_02_09_01_030_RT_BIGINT_ASUINTN
 * @expect runtime
 * @section 2.9.1
 * @design BigInt.asUintN() 函数验证
 * @note runtime 用例：验证 BigInt.asUintN() 函数
 */

function main(): void {
  // 验证 asUintN(8, 256) = 0
  let x1: bigint = BigInt.asUintN(8, 256n)
  if (x1 !== 0n) { throw new Error("asUintN(8, 256) failed, got " + x1) }

  // 验证 asUintN(8, 255) = 255
  let x2: bigint = BigInt.asUintN(8, 255n)
  if (x2 !== 255n) { throw new Error("asUintN(8, 255) failed, got " + x2) }

  // 验证 asUintN(16, 65535) = 65535
  let x3: bigint = BigInt.asUintN(16, 65535n)
  if (x3 !== 65535n) { throw new Error("asUintN(16, 65535) failed, got " + x3) }
}
