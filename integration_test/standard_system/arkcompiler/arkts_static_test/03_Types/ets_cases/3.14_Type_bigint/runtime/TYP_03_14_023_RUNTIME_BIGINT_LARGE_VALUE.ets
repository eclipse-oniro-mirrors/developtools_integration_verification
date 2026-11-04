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
 * @id TYP_03_14_023_RUNTIME_BIGINT_LARGE_VALUE
 * @expect runtime
 * @section 3.14
 * @design 验证 bigint 任意精度特性（超过 long 最大值）
 * @note 运行时用例：实际执行验证 bigint 大数操作
 */
function main(): void {
  // 超过 long 最大值的 bigint
  let big: bigint = 9223372036854775808n  // long max + 1
  if (big <= 9223372036854775807n) throw new Error("should be greater than long max")

  // 大数乘法
  let a: bigint = 999999999999999999n
  let b: bigint = 999999999999999999n
  let product: bigint = a * b
  if (product !== 999999999999999998000000000000000001n) throw new Error("product failed")

  console.log("verified")
}
