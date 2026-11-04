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
 * @id EXP_07_23_03_034_RUNTIME_BIGINT_REMAINDER_IDENTITY
 * @expect runtime
 * @section 7.23.3
 * @design 验证 bigint 取余恒等式 (a/b)*b + (a%b) == a 成立。
 *         结果符号与被除数相同。
 * @note 运行时用例：验证 bigint 取余恒等式和符号规则
 */
function main(): void {
  // 正数 % 正数
  let r1: bigint = 10n % 3n
  if (r1 != 1n) {
    throw new Error('10n%3n should be 1n, got ' + r1)
  }
  let id1: bigint = (10n / 3n) * 3n + r1
  if (id1 != 10n) {
    throw new Error('Identity failed for 10n%3n')
  }

  // 负数 % 正数 = 负（与被除数同号）
  let r2: bigint = (-10n) % 3n
  if (r2 != -1n) {
    throw new Error('(-10n)%3n should be -1n, got ' + r2)
  }
  let id2: bigint = ((-10n) / 3n) * 3n + r2
  if (id2 != -10n) {
    throw new Error('Identity failed for (-10n)%3n')
  }

  // 大数 bigint 取余
  let big: bigint = 999999999999999999999999999999n
  let d: bigint = 123456789n
  let r3: bigint = big % d
  let id3: bigint = (big / d) * d + r3
  if (id3 != big) {
    throw new Error('Identity failed for big bigint remainder')
  }
console.log('verified')
}
main()
