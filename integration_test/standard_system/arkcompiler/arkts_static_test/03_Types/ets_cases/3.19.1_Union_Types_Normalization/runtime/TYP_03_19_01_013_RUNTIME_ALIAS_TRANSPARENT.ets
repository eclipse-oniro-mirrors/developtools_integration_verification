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
 * @id TYP_03_19_01_013_RUNTIME_ALIAS_TRANSPARENT
 * @expect runtime
 * @section 3.19.1
 * @design alias 展开归一化后运行时值保持
 * @note 运行时用例：type alias chain number|string
 */
type A13 = B13
type B13 = C13
type C13 = number | string

function main(): void {
  let u: A13 = 3.14
  if (!(u instanceof number)) {
    throw new Error("u should hold number")
  }

  u = "hello"
  if (!(u instanceof string)) {
    throw new Error("u should hold string")
  }

  console.log("Alias transparent runtime verified")
}