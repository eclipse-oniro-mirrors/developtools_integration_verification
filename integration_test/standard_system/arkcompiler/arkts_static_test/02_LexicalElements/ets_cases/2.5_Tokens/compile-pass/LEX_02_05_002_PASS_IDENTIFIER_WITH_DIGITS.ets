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
 * @id LEX_02_05_002_PASS_IDENTIFIER_WITH_DIGITS
 * @expect compile-pass
 * @section 2.5
 * @design Identifiers Token: 含数字的标识符（数字不可在首位）
 * @note 正向用例：如 var1, item2, x123 等
 */
function testIdentifierWithDigits(): void {
  let var1: int = 1
  let item2: int = 2
  let x123: int = 3
}
