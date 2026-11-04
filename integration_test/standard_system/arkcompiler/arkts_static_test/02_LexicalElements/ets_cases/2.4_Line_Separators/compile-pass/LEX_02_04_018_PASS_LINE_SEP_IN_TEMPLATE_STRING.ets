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
 * @id LEX_02_04_018_PASS_LINE_SEP_IN_TEMPLATE_STRING
 * @expect compile-pass
 * @section 2.4
 * @design 模板字符串 ` ` 内允许换行作为内容
 * @note 正向用例：模板字符串包含真实换行字符
 */
function testLineSepInTemplateString(): void {
  let s: string = `line1
line2
line3`
}
