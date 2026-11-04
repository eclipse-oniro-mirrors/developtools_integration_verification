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
 * @id LEX_02_09_05_010_RT_BOOLEAN_NOT
 * @expect runtime
 * @section 2.9.5
 * @design 布尔 NOT 运算正确性
 * @note runtime 用例：验证布尔 NOT 运算结果
 */

function main(): void {
  // 验证 NOT 运算
  let x1: boolean = !true
  if (x1 !== false) { throw new Error("!true failed") }

  let x2: boolean = !false
  if (x2 !== true) { throw new Error("!false failed") }

  // 验证双重 NOT
  let x3: boolean = !!true
  if (x3 !== true) { throw new Error("!!true failed") }

  let x4: boolean = !!false
  if (x4 !== false) { throw new Error("!!false failed") }

  // 验证 NOT 与变量
  let a: boolean = true
  let b: boolean = !a
  if (b !== false) { throw new Error("!true variable failed") }
}
