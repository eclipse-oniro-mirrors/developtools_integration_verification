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
 * @id TYP_03_13_019_PASS_STRING_CHAR_RELATION
 * @expect compile-pass
 * @section 3.13
 * @design 验证 char 与 string 的关系——char 在关系运算中可转为 int
 * @note 正向用例：char 字面量可参与关系比较
 */
function main(): void {
  let c1: char = c'a'
  let c2: char = c'b'
  if (!(c1 < c2)) throw new Error("char relation failed")
  console.log("verified")
}