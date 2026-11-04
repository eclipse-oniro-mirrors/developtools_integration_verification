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
 * @id TYP_03_21_02_005_PASS_NONNULLABLE_ANY
 * @expect compile-pass
 * @section 3.21.2
 * @design NonNullable<Any> → Any - null - undefined
 * @note 正向用例：spec §3.21.2 规定
 */
type NonNullableAny = NonNullable<Any>

function testNonNullableAny(): void {
  let a: NonNullableAny = 42
  a = "hello"
  a = new Object()
}