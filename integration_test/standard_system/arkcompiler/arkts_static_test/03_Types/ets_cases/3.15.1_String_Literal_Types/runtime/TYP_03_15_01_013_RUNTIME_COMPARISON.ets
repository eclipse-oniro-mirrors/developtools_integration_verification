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
 * @id TYP_03_15_01_013_RUNTIME_COMPARISON
 * @expect runtime
 * @section 3.15.1
 * @design 验证 string literal type 比较运算
 * @note 运行时用例：实际执行验证比较结果
 */
function main(): void {
  let s0: "hello" = "hello"
  let s1: "hello" = "hello"
  let s2: "world" = "world"

  if (s0 !== s1) throw new Error("s0 should equal s1")
  if (s0 === s2) throw new Error("s0 should not equal s2")
  if (!(s0 < s2)) throw new Error("hello should be less than world")

  console.log("verified")
}
