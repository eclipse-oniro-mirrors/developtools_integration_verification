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
 * @id LEX_02_05_032_RT_BITWISE_OPS
 * @expect runtime
 * @section 2.5
 * @design 位运算符 Token 的运行结果
 * @note 运行时用例：& | ^ << >> >>>
 */
function main(): void {
  let a: int = 12  // 1100
  let b: int = 10  // 1010
  if ((a & b) !== 8) { throw new Error("a & b !== 8") }
  if ((a | b) !== 14) { throw new Error("a | b !== 14") }
  if ((a ^ b) !== 6) { throw new Error("a ^ b !== 6") }
  if ((a << 2) !== 48) { throw new Error("a << 2 !== 48") }
  if ((a >> 1) !== 6) { throw new Error("a >> 1 !== 6") }
}
