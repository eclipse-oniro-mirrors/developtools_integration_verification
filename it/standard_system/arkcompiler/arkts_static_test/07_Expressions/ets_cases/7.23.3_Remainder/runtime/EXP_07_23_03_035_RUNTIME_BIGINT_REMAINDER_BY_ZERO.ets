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
 * @id EXP_07_23_03_035_RUNTIME_BIGINT_REMAINDER_BY_ZERO
 * @expect runtime
 * @section 7.23.3
 * @design 验证 bigint 取余除零 0n 时抛运行时错误。
 *         spec：If the divisor value of the bigint remainder operator is 0n,
 *         then a runtime error is thrown during execution.
 * @runtime-throws=Error
 * @note 运行时用例：bigint 变量取余除零 0n 应抛运行时错误
 */
function main(): void {
  let a: bigint = 10n
  let b: bigint = 0n
  let c: bigint = a % b
}
main()
