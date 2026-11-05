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
 * @id TYP_03_12_023_RUNTIME_NULL_DISTINCT_UNDEFINED
 * @expect runtime
 * @section 3.12
 * @design 运行时验证 null 和 undefined 是不同的值，严格不等
 * @note 运行时用例：验证 null !== undefined（严格比较）
 */
function main(): void {
  let n: null = null
  let u: undefined = undefined

  if (n === u) {
    throw new Error("null should not be strictly equal to undefined")
  }

  let tri: int | null | undefined = null
  tri = undefined
  tri = 5
  if (tri == null) {
    throw new Error("5 should not equal null")
  }
  if (tri === null) {
    throw new Error("5 should not strictly equal null")
  }

  console.log("TYP_03_12_023 verified")
}