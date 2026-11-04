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
 * @id TYP_03_13_024_PASS_STRING_NUMBER_PLUS_STRING
 * @expect compile-pass
 * @section 3.13
 * @design 验证 number + string 表达式在字符串上下文中隐式转换
 * @note 正向用例：number + string 产生 string 类型（隐式数值转字符串）
 */
let n: int = 42
let s: string = n + " hello"

function main(): void {
  if (s !== "42 hello") throw new Error("number + string concat failed")
  console.log("verified")
}