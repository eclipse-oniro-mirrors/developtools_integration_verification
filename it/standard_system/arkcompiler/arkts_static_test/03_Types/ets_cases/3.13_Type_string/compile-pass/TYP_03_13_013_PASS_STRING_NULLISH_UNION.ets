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
 * @id TYP_03_13_013_PASS_STRING_NULLISH_UNION
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string | null、string | undefined、string | null | undefined 联合类型
 * @note 正向用例：nullish 联合类型声明与赋值
 */
let a: string | null = null
let b: string | undefined = undefined
let c: string | null | undefined = null

function main(): void {
  a = "hello"
  b = "world"
  c = "test"
  if (a !== "hello") throw new Error("nullish assign failed")
  if (b !== "world") throw new Error("nullish assign2 failed")
  console.log("verified")
}