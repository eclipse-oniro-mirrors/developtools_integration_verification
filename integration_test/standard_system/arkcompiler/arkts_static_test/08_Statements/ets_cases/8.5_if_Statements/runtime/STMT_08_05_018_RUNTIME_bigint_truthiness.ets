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
 * @id STMT_08_05_018_RUNTIME_bigint_truthiness
 * @expect runtime
 * @section 8.5
 * @design 运行时验证 bigint 在 if 条件中的 truthiness — 0n 为 falsy，非 0n（正/负）为 truthy
 * @note 运行时用例：覆盖 0n、1n、-1n、大整数、与 else 组合、无 else 模式
 */
function main(): void {
  let r: int = 0

  // 1n → truthy: then 执行
  r = 0
  if (1n) { r = 1 }
  if (r != 1) { throw new Error("if (1n) should execute then-branch") }

  // 0n → falsy: then 不执行（无 else，r 不变）
  r = 0
  if (0n) { r = 99 }
  if (r != 0) { throw new Error("if (0n) should NOT execute then-branch") }

  // 0n → falsy: else 执行
  r = 0
  if (0n) { r = 99 }
  else { r = 2 }
  if (r != 2) { throw new Error("if (0n) else should execute else-branch") }

  // -1n → truthy: then 执行
  r = 0
  if (-1n) { r = 3 }
  if (r != 3) { throw new Error("if (-1n) should execute then-branch") }

  // 大整数 9999999999999999n → truthy
  r = 0
  if (9999999999999999n) { r = 4 }
  if (r != 4) { throw new Error("if (large bigint) should execute then-branch") }

  // bigint 变量 0n → falsy
  r = 0
  let bZero: bigint = 0n
  if (bZero) { r = 99 }
  if (r != 0) { throw new Error("bigint var 0n should be falsy") }

  // bigint 变量 1n → truthy
  r = 0
  let bOne: bigint = 1n
  if (bOne) { r = 5 }
  if (r != 5) { throw new Error("bigint var 1n should be truthy") }

  // bigint 变量 -1n → truthy
  r = 0
  let bNeg: bigint = -1n
  if (bNeg) { r = 6 }
  if (r != 6) { throw new Error("bigint var -1n should be truthy") }

  // !0n → truthy（对 falsy 取非得 truthy）
  r = 0
  if (!bZero) { r = 7 }
  if (r != 7) { throw new Error("!bigint 0n should be truthy") }

  // !!1n → truthy（双重否定仍为 truthy）
  r = 0
  if (!!bOne) { r = 8 }
  if (r != 8) { throw new Error("!!bigint 1n should be truthy") }

  console.log("verified")
}
