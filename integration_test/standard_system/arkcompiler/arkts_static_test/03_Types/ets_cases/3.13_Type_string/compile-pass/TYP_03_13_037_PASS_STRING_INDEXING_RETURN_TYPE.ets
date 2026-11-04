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
 * @id TYP_03_13_037_PASS_STRING_INDEXING_RETURN_TYPE
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 索引表达式 s[i] 返回 string 类型（非 char）
 * @note 正向用例：字符串索引结果可赋值给 string 类型变量
 */
function main(): void {
  let s: string = "hello"
  let ch: string = s[0]
  let ch2: string = s[1]
  if (ch !== "h") throw new Error("ch assert failed")
  if (ch2 !== "e") throw new Error("ch2 assert failed")
  console.log("verified")
}