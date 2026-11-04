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
 * @id TYP_03_19_01_004_PASS_UNION_STRING_LITERAL_ELIM
 * @expect compile-pass
 * @section 3.19.1
 * @design 字符串字面量消除："325" | string | number → string | number
 * @note 正向用例：验证联合类型中 string 字面量被 string 消除
 */
type BMW_ModelCode = "325" | "530" | "735"
type WithString = BMW_ModelCode | string | number

function main(): void {
  let car_code: WithString = "325"
  car_code = "any string"
  car_code = 42
  console.log("verified")
}