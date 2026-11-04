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
 * @id TYP_03_21_03_004_PASS_OBJECT_LITERAL
 * @expect compile-pass
 * @section 3.21.3
 * @design Object literal 可赋值 Partial（有自己内置 setter）
 * @note 正向用例：spec §3.21.3 例子
 */
interface I4 {
  property: number
}

function foo4(partial: Partial<I4>): void {
  partial.property = 42
}

function testObjectLiteral(): void {
  foo4({property: 1})
}