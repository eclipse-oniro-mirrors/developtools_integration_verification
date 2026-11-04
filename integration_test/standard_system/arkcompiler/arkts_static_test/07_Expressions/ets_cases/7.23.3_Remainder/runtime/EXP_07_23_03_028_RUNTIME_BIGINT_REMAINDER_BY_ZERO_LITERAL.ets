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
 * @id EXP_07_23_03_028_FAIL_BIGINT_REMAINDER_BY_ZERO_LITERAL
 * @expect runtime
 * @section 7.23.3
 * @design 验证字面量 bigint 取余除零 0n 产生编译时错误。
 *         spec：If the divisor value of the bigint remainder operator is 0n,
 *         then a runtime error is thrown during execution.
 *         如编译期可检测到 0n 则产生编译时错误。
 * @note 反向用例：spec 要求报错，但 ArkTS 实际编译通过（与除法 / 0n 不同）
 *       ⚠️ SPEC 不一致：bigint 除法检测 0n 但取余不检测 0n
 *       分类：D 类（Spec 与实现不一致）
 */
function main(): void {
  let a: bigint = 100n
  let b: bigint = a % 0n
}
main()

