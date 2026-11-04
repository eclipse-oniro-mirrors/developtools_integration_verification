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
/*
 * @id SEM_15_14_00_020_PASS_BIGINT_truthiness
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：bigint 类型的真值检查
 * @note 测试 bigint 类型的真值检查
 */

// 测试 bigint 类型的真值检查
function testBigintTruthiness(): void {
  // bigint 类型的真值检查
  let b1: bigint = 10n
  if (b1) {
    console.log('BigInt 10n is truthy')  // 输出: BigInt 10n is truthy
  }
  
  let b2: bigint = 0n
  if (!b2) {
    console.log('BigInt 0n is falsy')  // 输出: BigInt 0n is falsy
  
}
console.log('BigInt truthiness test passed')
}