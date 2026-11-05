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
 * @id EXP_07_23_01_022_FAIL_BOOLEAN_MULTIPLICATION
 * @expect compile-fail
 * @section 7.23.1
 * @design 验证布尔乘法 boolean * boolean 产生编译时错误。
 *         乘法运算符不接受 boolean 类型。
 * @note 反向用例：布尔乘法应报编译时错误
 */
function main(): void {
  let a: boolean = true
  let b: boolean = false
  let c = a * b
}
main()
