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
 * @id LEX_02_09_04_010_RT_BIGINT_CONVERSION
 * @expect runtime
 * @section 2.9.4
 * @design BigInt 转换函数验证
 * @note runtime 用例：验证 BigInt() 转换函数
 */

function main(): void {
  // 验证 BigInt() 转换函数
  let x1: bigint = BigInt("153")
  let x2: bigint = BigInt(153)

  if (x1 !== 153n) { throw new Error("BigInt(string) failed") }
  if (x2 !== 153n) { throw new Error("BigInt(long) failed") }

  // 验证 BigInt() 转换大数值
  let x3: bigint = BigInt("9876543210")
  if (x3 !== 9876543210n) { throw new Error("BigInt(large string) failed") }
}
