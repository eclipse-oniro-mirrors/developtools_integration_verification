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
 * @id LEX_02_05_003_PASS_IDENTIFIER_DOLLAR
 * @expect compile-pass
 * @section 2.5
 * @design Identifiers Token: 含 $ 的标识符
 * @note 正向用例：$ 可作为标识符首字符或任意位置
 */
function testIdentifierDollar(): void {
  let $value: int = 1
  let foo$bar: int = 2
  let $: int = 3
}
