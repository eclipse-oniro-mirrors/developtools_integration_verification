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
 * @id TYP_03_13_032_RUNTIME_STRING_FOR_OF_ITERABLE
 * @expect runtime
 * @section 3.13
 * @design 验证 string 是 iterable 类型，for-of 逐字符遍历
 * @note 运行时用例：验证 for-of 遍历 string 产生每个字符
 */
function main(): void {
  let s: string = "abc"
  let result: string = ""
  for (let c of s) {
    result = result + c
  }
  if (result !== "abc") throw new Error("for-of assert failed")

  let empty: string = ""
  let count: int = 0
  for (let c of empty) {
    count++
  }
  if (count !== 0) throw new Error("empty for-of failed")

  console.log("verified")
}