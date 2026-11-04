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
 * @id TYP_03_14_002_PASS_NEW_BIGINT
 * @expect compile-pass
 * @section 3.14
 * @design 验证 new bigint 创建默认值 0
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let b1: bigint = new bigint
let b2: bigint = new BigInt(5)

function main(): void {
  if (b1 !== 0n) throw new Error("b1 should be 0")
  if (b2 !== 5n) throw new Error("b2 should be 5")
  console.log("verified")
}
