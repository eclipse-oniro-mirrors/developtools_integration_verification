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
 * @id LEX_02_06_003_PASS_LT_LETTER_START
 * @expect compile-pass
 * @section 2.6
 * @design IdentifierStart: Lt (Titlecase Letter) - 如 ǅ (ǅ)
 * @note 正向用例：UnicodeIDStart 的 Lt 类别
 */
function testLtStart(): void {
  let ǅx: int = 1
  let ǈy: int = 2
}
