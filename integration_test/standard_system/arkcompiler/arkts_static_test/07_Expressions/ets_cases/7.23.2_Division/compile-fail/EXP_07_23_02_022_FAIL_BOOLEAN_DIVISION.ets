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
 * @id EXP_07_23_02_022_FAIL_BOOLEAN_DIVISION
 * @expect compile-fail
 * @section 7.23.2
 * @design 验证布尔值除法 boolean / boolean 产生编译时错误。
 *         除法运算符仅接受数值类型和 bigint，boolean 不在其中。
 * @note 反向用例：布尔值除法应报编译时错误
 */
function main(): void {
  let a: boolean = true
  let b: boolean = false
  let c = a / b
}
main()
