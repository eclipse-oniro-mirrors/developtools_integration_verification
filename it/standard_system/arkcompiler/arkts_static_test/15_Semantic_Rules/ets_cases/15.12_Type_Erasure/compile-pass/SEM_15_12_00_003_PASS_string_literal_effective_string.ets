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
/*
 * @id SEM_15_12_00_003_PASS_string_literal_effective_string
 * @expect compile-pass
 * @section 15.12
 * @design 字符串字面量有效类型为 `string`。
 * @note Generated one-to-one from test_design.
 */

function sem1512Pass001StringLiteralEffectiveString(): void {
  let value: int = 1
  value = value + 1
}

