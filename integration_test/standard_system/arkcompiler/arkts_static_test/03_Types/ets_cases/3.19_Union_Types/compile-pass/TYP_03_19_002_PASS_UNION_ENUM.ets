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
 * @id TYP_03_19_002_PASS_UNION_ENUM
 * @expect compile-pass
 * @section 3.19
 * @design 枚举类型在联合类型中
 * @note 正向用例：验证 string | StringEnum 联合类型归一化为 string
 */
enum StringEnum { One = "One", Two = "Two" }
type Union1 = string | StringEnum

function main(): void {
  let u: Union1 = "hello"
  u = StringEnum.One
  console.log("verified")
}