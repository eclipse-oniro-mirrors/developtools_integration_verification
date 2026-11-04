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
 * @id TYP_03_13_005_PASS_STRING_LENGTH
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string.length 属性返回 int 类型
 * @note 正向用例：string.length 返回非负整数
 */
let s: string = "hello"
let len: int = s.length

function main(): void {
  if (len !== 5) throw new Error("length assert failed")
  let empty_len: int = "".length
  if (empty_len !== 0) throw new Error("empty length assert failed")
  console.log("verified")
}