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
 * @id TYP_03_06_02_015_RUNTIME_TYPE_PROMOTION_INT
 * @expect runtime
 * @section 3.6.2
 * @design byte/short 运算自动推升为 int（spec §3.6.2 32-bit 兜底规则）
 * @note 运行时用例：byte + short 结果是 int，使用 32 位精度
 */
function main(): void {
  let by: byte = 100
  let sh: short = 200

  // byte + short → int
  let r: int = by + sh
  if (r != 300) {
    throw new Error("byte + short promotion failed: " + r)
  }

  // 两个 byte 相乘可能超过 byte 范围，但提升为 int 后正确
  let bA: byte = 100
  let bB: byte = 50
  let prod: int = bA * bB
  if (prod != 5000) {
    throw new Error("byte * byte → int failed: " + prod)
  }

  console.log("Type promotion int verified")
}