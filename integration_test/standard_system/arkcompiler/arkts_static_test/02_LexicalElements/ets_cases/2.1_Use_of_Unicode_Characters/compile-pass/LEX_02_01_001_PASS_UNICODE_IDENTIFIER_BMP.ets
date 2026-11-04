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
 * @id LEX_02_01_001_PASS_UNICODE_IDENTIFIER_BMP
 * @expect compile-pass
 * @section 2.1
 * @design BMP范围的Unicode字母作为标识符: \u0041转义、中文、日文、韩文、希腊、西里尔 * @note 正向用例：验证该特性编译通过的正确用法

 */
function testUnicodeIdentifierBMP(): void {
  let \u0041var: number = 1
  let 变量: number = 42
  let へんすう: string = "hello"
  let 변수: number = 100
  let α: number = 3.14
  let П: number = 3
}
