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
 * @id TYP_03_06_04_013_RUNTIME_BITWISE_TRUTH_TABLE
 * @expect runtime
 * @section 3.6.4
 * @design boolean 按位 & ^ | 真值表
 * @note 运行时用例：与/异或/或
 */
function main(): void {
  // AND
  if ((true & true) != true) throw new Error("T & T = T")
  if ((true & false) != false) throw new Error("T & F = F")
  if ((false & true) != false) throw new Error("F & T = F")
  if ((false & false) != false) throw new Error("F & F = F")

  // OR
  if ((true | true) != true) throw new Error("T | T = T")
  if ((true | false) != true) throw new Error("T | F = T")
  if ((false | true) != true) throw new Error("F | T = T")
  if ((false | false) != false) throw new Error("F | F = F")

  // XOR
  if ((true ^ true) != false) throw new Error("T ^ T = F")
  if ((true ^ false) != true) throw new Error("T ^ F = T")
  if ((false ^ true) != true) throw new Error("F ^ T = T")
  if ((false ^ false) != false) throw new Error("F ^ F = F")

  console.log("Bitwise truth table verified")
}