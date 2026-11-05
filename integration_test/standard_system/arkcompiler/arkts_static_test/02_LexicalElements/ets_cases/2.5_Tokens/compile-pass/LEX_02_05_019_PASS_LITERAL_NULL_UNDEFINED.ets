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
 * @id LEX_02_05_019_PASS_LITERAL_NULL_UNDEFINED
 * @expect compile-pass
 * @section 2.5
 * @design Literals Token: null / undefined 字面量
 * @note 正向用例：null/undefined 字面量作为 Token
 */
function testLiteralNullUndefined(): void {
  let n: string | null = null
  let u: string | undefined = undefined
}
