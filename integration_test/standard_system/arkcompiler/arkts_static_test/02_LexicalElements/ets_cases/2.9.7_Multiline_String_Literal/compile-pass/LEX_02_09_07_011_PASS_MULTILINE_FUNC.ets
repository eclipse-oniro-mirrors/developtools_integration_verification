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
 * @id LEX_02_09_07_011_PASS_MULTILINE_FUNC
 * @expect compile-pass
 * @section 2.9.7
 * @design 多行字符串在函数中
 * @note compile-pass 用例：验证多行字符串在函数中的使用
 */

// 多行字符串作为函数参数
function printMultiline(s: string): void {
  let x = s
}

let s1 = `Hello
World`
printMultiline(s1)

// 多行字符串作为返回值
function getMultiline(): string {
  return `Line 1
Line 2`
}

let s2 = getMultiline()
