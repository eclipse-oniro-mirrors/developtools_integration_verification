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
 * @id LEX_02_01_002_PASS_UNICODE_IDENTIFIER_SPECIAL
 * @expect compile-pass
 * @section 2.1
 * @design 特殊Unicode字符作为标识符开头: $开头、_开头、ZWJ(U+200D)、ZWNJ(U+200C)
 * @note 正向用例：验证特殊字符作为标识符开头能够正确编译
 */
function testUnicodeIdentifierSpecial(): void {
  let $变量: number = 1
  let _underscore: string = "hello"
  let text\u200D文本: number = 42
  let text\u200C文本: boolean = true
}
