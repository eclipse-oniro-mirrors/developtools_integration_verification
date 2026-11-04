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
 * @id TYP_03_13_001_PASS_STRING_LITERAL
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 字面量声明与赋值
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let s1: string = "hello"
let s2: string = ""
let s3: string = "ArkTS"

function main(): void {
  if (s1 !== "hello") throw new Error("s1 assert failed")
  if (s2 !== "") throw new Error("s2 assert failed")
  if (s3 !== "ArkTS") throw new Error("s3 assert failed")
  console.log("verified")
}