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
 * @id LEX_02_06_016_PASS_LETTER_ZWJ_LETTER
 * @expect compile-pass
 * @section 2.6
 * @design IdentifierPart: Letter + ZWJ + Letter 组合
 * @note 正向用例：a + ZWJ + b 与 a + ZWNJ + b 是不同标识符
 */
function testLetterZwjLetter(): void {
  let a‍b: int = 1
  let a‌b: int = 2
}
