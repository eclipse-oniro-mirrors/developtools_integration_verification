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
 * @id LEX_02_06_010_PASS_DIGIT_IN_PART
 * @expect compile-pass
 * @section 2.6
 * @design IdentifierPart: Nd (Decimal Digit) 字符
 * @note 正向用例：标识符中可含数字（非首字符）
 */
function testDigitInPart(): void {
  let v0: int = 0
  let v9: int = 9
  let var123: int = 123
  let item9999: int = 9999
}
