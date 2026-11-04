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
 * @id TYP_03_15_01_007_PASS_RELATIONAL
 * @expect compile-pass
 * @section 3.15.1
 * @design 验证 string literal type 关系比较
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let s0: "apple" = "apple"
let s1: "banana" = "banana"

function main(): void {
  if (!(s0 < s1)) throw new Error("apple should be less than banana")
  if (s0 > s1) throw new Error("apple should not be greater than banana")
  console.log("verified")
}
