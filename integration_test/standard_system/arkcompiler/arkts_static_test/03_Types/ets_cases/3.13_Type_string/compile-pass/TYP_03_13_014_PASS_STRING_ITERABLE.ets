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
 * @id TYP_03_13_014_PASS_STRING_ITERABLE
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 是 iterable 类型，可用于 for-of
 * @note 正向用例：string 可被 for-of 遍历逐字符
 */
function main(): void {
  let s: string = "abc"
  let count: int = 0
  for (let c of s) {
    count++
  }
  if (count !== 3) throw new Error("iterable assert failed")
  console.log("verified")
}