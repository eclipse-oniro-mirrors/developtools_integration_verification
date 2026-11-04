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
 * @id TYP_03_14_022_RUNTIME_BIGINT_ARITHMETIC
 * @expect runtime
 * @section 3.14
 * @design 验证 bigint 算术运算运行时行为
 * @note 运行时用例：实际执行验证 bigint 算术运算
 */
function main(): void {
  let a: bigint = 100n
  let b: bigint = 3n

  if (a + b !== 103n) throw new Error("add failed")
  if (a - b !== 97n) throw new Error("sub failed")
  if (a * b !== 300n) throw new Error("mul failed")
  if (a / b !== 33n) throw new Error("div failed")
  if (a % b !== 1n) throw new Error("mod failed")
  if (-a !== -100n) throw new Error("neg failed")

  console.log("verified")
}
