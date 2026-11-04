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
 * @id TYP_03_13_017_PASS_STRING_RELATIONAL
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 的关系运算符 < > <= >=（字典序比较）
 * @note 正向用例：字符串按字典序比较
 */
function main(): void {
  if (!("abc" < "abd")) throw new Error("lt assert failed")
  if (!("abd" > "abc")) throw new Error("gt assert failed")
  if (!("abc" <= "abc")) throw new Error("le assert failed")
  if (!("abd" >= "abc")) throw new Error("ge assert failed")
  console.log("verified")
}