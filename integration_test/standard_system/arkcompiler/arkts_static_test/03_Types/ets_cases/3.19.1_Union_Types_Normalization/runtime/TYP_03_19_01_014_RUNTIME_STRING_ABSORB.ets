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
 * @id TYP_03_19_01_014_RUNTIME_STRING_ABSORB
 * @expect runtime
 * @section 3.19.1
 * @design string 吸收 string literal 后运行时仍是 string
 * @note 运行时用例："a"|string → string
 */
type U14 = "a" | "b" | string

function main(): void {
  let u: U14 = "a"
  if (!(u instanceof string)) {
    throw new Error("literal should be string at runtime")
  }

  u = "not literal"
  if (u.length != 11) {
    throw new Error("string behavior failed")
  }

  console.log("String absorb runtime verified")
}