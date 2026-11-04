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
 * @id TYP_03_12_012_PASS_NULL_DISTINCT_FROM_UNDEFINED
 * @expect compile-pass
 * @section 3.12
 * @design null 和 undefined 是不同类型、不同值，可共存于联合类型
 * @note 正向用例：验证 null 与 undefined 类型不兼容但可共存于联合类型
 */
function testNullDistinctFromUndefined(): void {
  let a: null = null
  let b: undefined = undefined
  let c: null | undefined = null
  c = undefined
  let d: int | null | undefined = null
  d = undefined
  d = 5
}