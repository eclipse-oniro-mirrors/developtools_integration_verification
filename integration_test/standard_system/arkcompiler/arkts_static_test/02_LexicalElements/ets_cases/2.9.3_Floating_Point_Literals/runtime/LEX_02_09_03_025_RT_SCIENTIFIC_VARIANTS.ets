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
 * @id LEX_02_09_03_025_RT_SCIENTIFIC_VARIANTS
 * @expect runtime
 * @section 2.9.3
 * @design 科学计数法变体运行时验证
 * @note runtime 用例：验证科学计数法不同变体的运行时行为
 */

function main(): void {
  // 科学计数法变体
  let x1 = 1.5E10
  if (x1 !== 15000000000) { throw new Error("1.5E10 failed, got " + x1) }

  let x2 = 1.5e10
  if (x2 !== 15000000000) { throw new Error("1.5e10 failed, got " + x2) }

  let x3 = 1e-5
  if (x3 !== 0.00001) { throw new Error("1e-5 failed, got " + x3) }

  let x4 = 1E-5
  if (x4 !== 0.00001) { throw new Error("1E-5 failed, got " + x4) }

  let x5 = 1.5e+10
  if (x5 !== 15000000000) { throw new Error("1.5e+10 failed, got " + x5) }

  // 验证大小写 e/E 等价
  if (x1 !== x2) { throw new Error("E !== e") }
  if (x3 !== x4) { throw new Error("-5 !== -5") }
}
