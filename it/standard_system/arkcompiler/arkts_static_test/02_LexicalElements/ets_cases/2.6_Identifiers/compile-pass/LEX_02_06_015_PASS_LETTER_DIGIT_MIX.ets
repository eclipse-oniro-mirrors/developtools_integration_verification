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
 * @id LEX_02_06_015_PASS_LETTER_DIGIT_MIX
 * @expect compile-pass
 * @section 2.6
 * @design IdentifierPart: Letter + Digit + Letter 任意组合
 * @note 正向用例：a1b、x2y3z 等混合
 */
function testLetterDigitMix(): void {
  let a1b: int = 1
  let x2y3z: int = 2
  let v0_1_2: int = 3
}
