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
 * @id LEX_02_06_026_FAIL_UNICODE_DIGIT_START
 * @expect compile-fail
 * @section 2.6
 * @design Unicode Nd 类（如阿拉伯-印度数字 ٠ = ٠）不能作为标识符起始
 * @note 反向用例：Nd 字符开头应失败
 */
function testUnicodeDigitStart(): void {
  let ٠abc: int = 1
}
