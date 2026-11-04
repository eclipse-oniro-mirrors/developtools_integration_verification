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
 * @id TYP_03_03_011_PASS_STRING_LITERAL_INPLACE
 * @expect compile-pass
 * @section 3.3
 * @design 字符串字面量类型作为就地类型: let l: "xyz" = "xyz"
 * @note 正向用例：验证字符串字面量类型就地使用
 *       注：嵌套函数移到顶层（TYP-002 已知设计问题）
 */
function accept11(s: "yes" | "no"): void {}

function testStringLiteralInplace(): void {
  let l: "xyz" = "xyz"
  let m: "abc" | "def" = "abc"
  m = "def"

  accept11("yes")
  accept11("no")
}