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
 * @id TYP_03_14_001_PASS_BIGINT_LITERAL
 * @expect compile-pass
 * @section 3.14
 * @design 验证 bigint 字面量声明与赋值
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let b1: bigint = 123n
let b2: bigint = 0n
let b3: bigint = -123n

function main(): void {
  if (b1 !== 123n) throw new Error("b1 assert failed")
  if (b2 !== 0n) throw new Error("b2 assert failed")
  if (b3 !== -123n) throw new Error("b3 assert failed")
  console.log("verified")
}
