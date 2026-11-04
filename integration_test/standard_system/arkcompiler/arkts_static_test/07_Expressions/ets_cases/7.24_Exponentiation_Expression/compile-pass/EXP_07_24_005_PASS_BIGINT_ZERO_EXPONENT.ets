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
 * @id EXP_07_24_005_PASS_BIGINT_ZERO_EXPONENT
 * @expect compile-pass
 * @section 7.24
 * @design 验证 bigint 指数为 0n 时结果总是 1n：包括 0n**0n=1n, 任意正 bigint**0n=1n
 * @note 正向用例：验证 spec 中"result of raising to power 0n is always 1n"规则
 */
function main(): void {
  let a: bigint = 2n
  let b: bigint = 0n
  let c: bigint = a ** b   // 2n**0n=1n
  let d: bigint = 0n ** 0n  // 0n**0n=1n
  let e: bigint = 100n ** 0n // 100n**0n=1n
  console.log('verified')
}
