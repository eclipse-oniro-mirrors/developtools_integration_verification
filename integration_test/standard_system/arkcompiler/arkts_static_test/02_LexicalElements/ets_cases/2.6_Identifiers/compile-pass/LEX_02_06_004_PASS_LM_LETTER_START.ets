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
 * @id LEX_02_06_004_PASS_LM_LETTER_START
 * @expect compile-pass
 * @section 2.6
 * @design IdentifierStart: Lm (Modifier Letter) - 如 ʰ (modifier letter small h)
 * @note 正向用例：UnicodeIDStart 的 Lm 类别
 */
function testLmStart(): void {
  let ʰa: int = 1
  let ʱb: int = 2
}
