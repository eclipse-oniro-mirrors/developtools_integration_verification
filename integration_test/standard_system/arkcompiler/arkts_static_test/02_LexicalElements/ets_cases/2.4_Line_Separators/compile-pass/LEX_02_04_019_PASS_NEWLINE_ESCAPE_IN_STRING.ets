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
 * @id LEX_02_04_019_PASS_NEWLINE_ESCAPE_IN_STRING
 * @expect compile-pass
 * @section 2.4
 * @design 普通字符串内允许 \n 转义序列（不是真实换行）
 * @note 正向用例：转义序列 \n 不是行终止符
 */
function testNewlineEscapeInString(): void {
  let s1: string = "line1\nline2"
  let s2: string = 'tab\tand\nnewline'
}
