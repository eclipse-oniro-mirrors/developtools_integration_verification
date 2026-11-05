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
 * @id TYP_03_19_01_002_PASS_UNION_ALIAS_UNFOLD
 * @expect compile-pass
 * @section 3.19.1
 * @design 联合类型别名展开：type D = B | C → number | string
 * @note 正向用例：验证类型别名在联合类型中展开
 */
type B = number
type C = string
type D = B | C

function main(): void {
  let x: D = 42
  x = "hello"
  console.log("verified")
}