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
 * @id TYP_03_01_033_RUNTIME_BIGINT_OPS
 * @expect runtime
 * @section 3.1
 * @design bigint 大整数算术运算
 * @note 运行时用例：实际执行验证 bigint 超过 long 范围仍精确
 */
function main(): void {
  let a: bigint = 12345678901234567890n
  let b: bigint = 9876543210987654321n

  let sum: bigint = a + b
  let expected: bigint = 22222222112222222211n
  if (sum != expected) {
    throw new Error("bigint sum mismatch")
  }

  // 验证幂运算
  let two: bigint = 2n
  let pow32: bigint = two ** 32n
  if (pow32 != 4294967296n) {
    throw new Error("2^32 should be 4294967296")
  }

  // 验证负数
  let neg: bigint = -a
  if (neg != -12345678901234567890n) {
    throw new Error("Negation failed")
  }

  console.log("BigInt ops verified")
}