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
 * @id TYP_03_13_041_PASS_STRING_AS_FUNCTION_PARAM
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 作为函数参数传递（引用语义）
 * @note 正向用例：string 作为参数传入函数，函数内可访问值
 */
function takesString(s: string): int {
  return s.length
}

function main(): void {
  let len: int = takesString("ArkTS")
  if (len !== 5) throw new Error("param assert failed")
  console.log("verified")
}