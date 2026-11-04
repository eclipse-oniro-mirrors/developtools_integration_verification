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
 * @id LEX_02_06_013_PASS_UESCAPE_IN_PART
 * @expect compile-pass
 * @section 2.6
 * @design IdentifierPart: \uHHHH 转义在标识符中部
 * @note 正向用例：a\u0042c 等价于 aBc
 */
function testUEscapeInPart(): void {
  let a\u0042c: int = 1
  let foo\u4E2D: int = 2
}
