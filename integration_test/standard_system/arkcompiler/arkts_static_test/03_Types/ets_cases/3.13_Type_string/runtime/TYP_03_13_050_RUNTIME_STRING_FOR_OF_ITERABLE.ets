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
 * @id TYP_03_13_050_RUNTIME_STRING_FOR_OF_ITERABLE
 * @expect runtime
 * @section 3.13
 * @design 验证 string 是 iterable 类型，for-of 遍历逐字符（每个元素为 string 类型）
 * @note 运行时用例：验证 for-of 遍历 string 的每个字符
 */
function main(): void {
  let s: string = "abc"
  let chars: string[] = []
  for (let ch of s) {
    chars.push(ch)
  }
  if (chars.length !== 3) throw new Error("length assert failed, got: " + chars.length.toString())
  if (chars[0] !== "a") throw new Error("char 0 assert failed")
  if (chars[1] !== "b") throw new Error("char 1 assert failed")
  if (chars[2] !== "c") throw new Error("char 2 assert failed")

  let empty: string = ""
  let count: int = 0
  for (let ch of empty) {
    count++
  }
  if (count !== 0) throw new Error("empty string iteration assert failed")

  let unicodeStr: string = "ABC"
  let concat: string = ""
  for (let ch of unicodeStr) {
    concat = concat + ch
  }
  if (concat !== "ABC") throw new Error("concat iteration assert failed")

  console.log("TYP_03_13_050 verified")
}