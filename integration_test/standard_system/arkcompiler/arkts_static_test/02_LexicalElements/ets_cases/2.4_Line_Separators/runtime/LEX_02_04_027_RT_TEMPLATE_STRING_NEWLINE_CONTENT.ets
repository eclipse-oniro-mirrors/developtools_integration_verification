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
 * @id LEX_02_04_027_RT_TEMPLATE_STRING_NEWLINE_CONTENT
 * @expect runtime
 * @section 2.4
 * @design 模板字符串内的实际 LF 字符成为字符串内容
 * @note 运行时用例：验证 length 包含换行字符（"abc\ndef" = 7 chars）
 */
function main(): void {
  let s: string = `abc
def`
  if (s.length !== 7) { throw new Error("expected length 7, got " + s.length.toString()) }
}
