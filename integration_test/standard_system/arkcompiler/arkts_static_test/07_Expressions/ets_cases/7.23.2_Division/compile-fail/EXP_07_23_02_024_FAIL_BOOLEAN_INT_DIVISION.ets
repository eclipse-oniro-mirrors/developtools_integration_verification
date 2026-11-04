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
 * @id EXP_07_23_02_024_FAIL_BOOLEAN_INT_DIVISION
 * @expect compile-fail
 * @section 7.23.2
 * @design 验证 boolean / int 混合类型除法产生编译时错误。
 *         除法运算符要求数值类型与数值类型运算，或 bigint 与 bigint 运算。
 * @note 反向用例：布尔值与整数混合除法应报编译时错误
 */
function main(): void {
  let a: boolean = true
  let b: int = 5
  let c = a / b
}
main()
