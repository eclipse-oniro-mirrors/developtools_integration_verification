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
 * @id TYP_03_13_027_PASS_STRING_INDEX_VARIABLE
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 索引表达式使用变量索引是合法的
 * @note 正向用例：string 索引可以使用变量表达式（与 tuple 不同）
 */
function main(): void {
  let s: string = "hello"
  let i: int = 0
  let ch: string = s[i]
  if (ch !== "h") throw new Error("variable index assert failed")
  console.log("verified")
}