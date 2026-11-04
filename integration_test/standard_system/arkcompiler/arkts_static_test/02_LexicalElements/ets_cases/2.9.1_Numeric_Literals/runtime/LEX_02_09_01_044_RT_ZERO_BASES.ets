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
 * @id LEX_02_09_01_044_RT_ZERO_BASES
 * @expect runtime
 * @section 2.9.1
 * @design 零的不同表示运行时验证
 * @note runtime 用例：验证零的不同进制表示的运行时行为
 */

function main(): void {
  // 零的不同进制表示
  let x1 = 0
  let x2 = 0x0
  let x3 = 0o0
  let x4 = 0b0
  let x5 = 0.0
  let x6 = 0n

  // 验证它们都等于 0
  if (x1 !== 0) { throw new Error("0 failed, got " + x1) }
  if (x2 !== 0) { throw new Error("0x0 failed, got " + x2) }
  if (x3 !== 0) { throw new Error("0o0 failed, got " + x3) }
  if (x4 !== 0) { throw new Error("0b0 failed, got " + x4) }
  if (x5 !== 0.0) { throw new Error("0.0 failed, got " + x5) }
  if (x6 !== 0n) { throw new Error("0n failed, got " + x6) }

  // 验证它们相等
  if (x1 !== x2) { throw new Error("0 !== 0x0") }
  if (x2 !== x3) { throw new Error("0x0 !== 0o0") }
  if (x3 !== x4) { throw new Error("0o0 !== 0b0") }
}
