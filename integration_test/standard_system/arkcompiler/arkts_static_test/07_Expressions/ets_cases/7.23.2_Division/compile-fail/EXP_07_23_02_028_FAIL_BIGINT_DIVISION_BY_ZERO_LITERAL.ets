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
 * @id EXP_07_23_02_028_FAIL_BIGINT_DIVISION_BY_ZERO_LITERAL
 * @expect compile-fail
 * @section 7.23.2
 * @design 验证字面量 bigint 除零 0n 产生编译时错误。
 *         spec：If the divisor value of the bigint division operator is 0n,
 *         then either a compile-time error occurs if detected at compile time.
 * @note 反向用例：bigint 字面量除零 0n 应报编译时错误
 */
function main(): void {
  let a: bigint = 100n
  let b: bigint = a / 0n
}
main()
