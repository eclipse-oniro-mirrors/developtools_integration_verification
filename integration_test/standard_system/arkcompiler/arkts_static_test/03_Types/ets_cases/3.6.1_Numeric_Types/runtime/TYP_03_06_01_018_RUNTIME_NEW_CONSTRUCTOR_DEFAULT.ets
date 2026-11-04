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
 * @id TYP_03_06_01_018_RUNTIME_NEW_CONSTRUCTOR_DEFAULT
 * @expect runtime
 * @section 3.6.1
 * @design new 数值类型构造函数返回 0
 * @note 运行时用例：spec §3.6.1 例子原文「Output is: 0 0 0」
 */
function main(): void {
  let a_number = new number()
  let a_byte = new byte()
  let an_integer = new int()
  let a_short = new short()
  let a_long = new long()
  let a_float = new float()
  let a_double = new double()

  // spec 明确：输出全为 0
  if (a_number != 0) throw new Error("new number != 0")
  if (a_byte != 0) throw new Error("new byte != 0")
  if (an_integer != 0) throw new Error("new int != 0")
  if (a_short != 0) throw new Error("new short != 0")
  if (a_long != 0) throw new Error("new long != 0")
  if (a_float != 0) throw new Error("new float != 0")
  if (a_double != 0) throw new Error("new double != 0")

  console.log("new constructor default verified")
}