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
 * @id TYP_03_01_011_PASS_STRING_LITERAL_CONCAT
 * @expect compile-pass
 * @section 3.1
 * @design 字符串字面量(单引号/双引号)、字符串拼接(+)、空字符串、转义字符、多行模板字符串、length/索引访问、字符串与数值/布尔拼接、模板插值(${})
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testString(): void {
  let s: string = "hello"
  let s2: string = "world"
  let s3: string = s + " " + s2
  let s4: string = ""
  let s5: string = "hello\nworld\t!"
  let s6: string = `multiline
string literal`

  let len: int = s.length
  let first: string = s[0]

  let cmp1: boolean = s == s2
  let cmp2: boolean = s != s2

  let concatInt: string = "value: " + 42
  let concatBool: string = "flag: " + true
  let concatDouble: string = "pi: " + 3.14

  let template: string = `hello ${s} ${s2}`
}