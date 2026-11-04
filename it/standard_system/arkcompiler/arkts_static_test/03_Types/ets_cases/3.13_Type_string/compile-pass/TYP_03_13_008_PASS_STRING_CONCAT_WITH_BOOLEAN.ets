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
 * @id TYP_03_13_008_PASS_STRING_CONCAT_WITH_BOOLEAN
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string + boolean 隐式转换为 string
 * @note 正向用例：boolean 在字符串上下文中隐式转换为 "true"/"false"
 */
let b: boolean = true
let result: string = "flag: " + b

function main(): void {
  if (result !== "flag: true") throw new Error("string+bool assert failed")
  let b2: boolean = false
  let result2: string = "flag: " + b2
  if (result2 !== "flag: false") throw new Error("string+bool false assert failed")
  console.log("verified")
}