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
 * @id TYP_03_14_005_PASS_BIGINT_RELATIONAL
 * @expect compile-pass
 * @section 3.14
 * @design 验证 bigint 关系运算
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let a: bigint = 100n
let b: bigint = 200n

function main(): void {
  if (a >= b) throw new Error("a should be less than b")
  if (b <= a) throw new Error("b should be greater than a")
  if (a === b) throw new Error("a should not equal b")
  if (!(a < b)) throw new Error("a should be less than b")
  if (!(b > a)) throw new Error("b should be greater than a")
  if (!(a !== b)) throw new Error("a should not equal b")
  console.log("verified")
}
