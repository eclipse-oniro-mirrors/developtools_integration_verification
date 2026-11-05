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
 * @id TYP_03_14_006_PASS_BIGINT_ALIAS
 * @expect compile-pass
 * @section 3.14
 * @design 验证 BigInt 是 bigint 的别名
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let b1: BigInt = 123n
let b2: bigint = b1

function main(): void {
  if (b1 !== 123n) throw new Error("b1 assert failed")
  if (b2 !== 123n) throw new Error("b2 assert failed")
  console.log("verified")
}
