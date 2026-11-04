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
 * @id TYP_03_14_004_PASS_BIGINT_ARITHMETIC
 * @expect compile-pass
 * @section 3.14
 * @design 验证 bigint 算术运算
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let a: bigint = 100n
let b: bigint = 3n

function main(): void {
  if (a + b !== 103n) throw new Error("add failed")
  if (a - b !== 97n) throw new Error("sub failed")
  if (a * b !== 300n) throw new Error("mul failed")
  if (a / b !== 33n) throw new Error("div failed")
  if (a % b !== 1n) throw new Error("mod failed")
  if (-a !== -100n) throw new Error("neg failed")
  console.log("verified")
}
