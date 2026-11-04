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
 * @id TYP_03_19_01_001_PASS_UNION_LINEARIZE
 * @expect compile-pass
 * @section 3.19.1
 * @design 嵌套联合类型线性化：(T1 | T2) | (T3 | T4) → T1 | T2 | T3 | T4
 * @note 正向用例：验证嵌套联合类型正确归一化
 */
type Nested = (string | number) | (boolean | null)

function main(): void {
  let x: Nested = "hello"
  x = 42
  x = true
  x = null
  console.log("verified")
}