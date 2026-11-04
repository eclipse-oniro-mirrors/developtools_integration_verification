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
 * @id LEX_02_01_003_PASS_UNICODE_ESCAPE_IDENTIFIER
 * @expect compile-pass
 * @section 2.1
 * @design Unicode转义序列定义标识符: \uHHHH、\u{}转义等价性
 * @note 正向用例：验证\u转义和\u{}转义作为标识符能够正确编译
 */
function testUnicodeEscapeIdentifier(): void {
  let \u0041Name: string = "A"
  let \u03B1Name: string = "alpha"
  let \u{1F600}Name: string = "smile"
  let aName: string = "direct"
}
