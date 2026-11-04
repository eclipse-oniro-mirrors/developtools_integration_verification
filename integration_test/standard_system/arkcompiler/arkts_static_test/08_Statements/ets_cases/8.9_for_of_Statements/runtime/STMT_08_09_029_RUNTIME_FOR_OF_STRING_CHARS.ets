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
 * @id STMT_08_09_029_RUNTIME_FOR_OF_STRING_CHARS
 * @expect runtime
 * @section 8.9
 * @design 字符串 for-of 逐字符迭代

 * @note 运行时用例：实际执行验证字符串迭代
 */
function main(): void {
  let s: string = "ABC"
  let result: string = ""
  for (let ch of s) { result = result + ch }
  if (result != "ABC") { throw new Error("assertion: string iteration") }
  console.log("verified")
}
