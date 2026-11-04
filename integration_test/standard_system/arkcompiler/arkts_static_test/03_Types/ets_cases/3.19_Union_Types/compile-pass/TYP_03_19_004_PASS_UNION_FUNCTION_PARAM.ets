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
 * @id TYP_03_19_004_PASS_UNION_FUNCTION_PARAM
 * @expect compile-pass
 * @section 3.19
 * @design 联合类型作为函数参数和返回值
 * @note 正向用例：验证联合类型在函数签名中的使用（避免联合类型直接参与二元运算）
 */
type StringOrNumber = string | number

function process(value: StringOrNumber): StringOrNumber {
  return value
}

function main(): void {
  let result1: StringOrNumber = process("hello")
  let result2: StringOrNumber = process(42)
  console.log("verified")
}