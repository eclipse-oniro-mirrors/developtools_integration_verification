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
 * @id LEX_02_05_001_PASS_IDENTIFIER_SIMPLE
 * @expect compile-pass
 * @section 2.5
 * @design Identifiers Token: 简单字母标识符
 * @note 正向用例：标识符作为 Token 的基础形式
 */
function testIdentifierSimple(): void {
  let abc: int = 1
  let foo: int = 2
  let bar: int = abc + foo
}
