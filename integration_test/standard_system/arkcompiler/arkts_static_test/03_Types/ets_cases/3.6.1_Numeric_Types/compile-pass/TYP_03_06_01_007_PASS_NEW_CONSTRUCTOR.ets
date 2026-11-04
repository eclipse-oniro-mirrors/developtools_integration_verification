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
 * @id TYP_03_06_01_007_PASS_NEW_CONSTRUCTOR
 * @expect compile-pass
 * @section 3.6.1
 * @design new 构造数值类型实例（spec §3.6.1 原例）
 * @note 正向用例：new number / new byte / new int
 */
function testNewConstructor(): void {
  let a_number = new number()
  let a_byte = new byte()
  let an_integer = new int()
  let a_short = new short()
  let a_long = new long()
  let a_float = new float()
  let a_double = new double()
}