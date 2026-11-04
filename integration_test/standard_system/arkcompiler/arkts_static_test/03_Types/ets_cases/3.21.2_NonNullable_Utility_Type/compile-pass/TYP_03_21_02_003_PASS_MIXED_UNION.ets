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
 * @id TYP_03_21_02_003_PASS_MIXED_UNION
 * @expect compile-pass
 * @section 3.21.2
 * @design NonNullable 从复杂 union 中移除 null/undefined
 * @note 正向用例：int | string | null | undefined → int | string
 */
type M = NonNullable<int | string | null | undefined>

function testMixedUnion(): void {
  let m1: M = 42
  let m2: M = "hello"
}