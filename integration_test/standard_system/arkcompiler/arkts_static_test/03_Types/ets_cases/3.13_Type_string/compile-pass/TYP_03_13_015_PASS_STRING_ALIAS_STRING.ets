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
 * @id TYP_03_13_015_PASS_STRING_ALIAS_STRING
 * @expect compile-pass
 * @section 3.13
 * @design 验证 String 是 string 的别名
 * @note 正向用例：String 与 string 行为一致
 */
let s1: string = "hello"
let s2: String = "world"

function main(): void {
  if (s1 !== "hello") throw new Error("string alias failed")
  if (s2 !== "world") throw new Error("String alias failed")
  console.log("verified")
}