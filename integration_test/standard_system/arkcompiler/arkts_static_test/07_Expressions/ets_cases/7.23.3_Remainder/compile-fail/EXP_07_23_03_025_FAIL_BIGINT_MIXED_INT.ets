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
 * @id EXP_07_23_03_025_FAIL_BIGINT_MIXED_INT
 * @expect compile-fail
 * @section 7.23.3
 * @design 验证 bigint % int 混合类型取余产生编译时错误。
 *         bigint 只能与 bigint 运算，不能与 int/float 等数值类型混合。
 *         spec：No implicit conversion is applied to an operand.
 * @note 反向用例：bigint 与 int 混合取余应报编译时错误
 */
function main(): void {
  let a: bigint = 100n
  let b: int = 5
  let c = a % b
}
main()
