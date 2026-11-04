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
 * @id STMT_08_05_012_RUNTIME_char_condition_truthiness
 * @expect runtime
 * @section 8.5
 * @design 运行时验证 char 作为 if 条件的 truthiness — c'\u0000' 视为 false，非空字符视为 true
 * @note 运行时用例：Extended Conditional Expressions char truthiness 实际行为验证
 */
function main(): void {
  let c1: char = c'a'
  let r1: int = 0
  if (c1) { r1 = 1 }
  if (r1 != 1) { throw new Error("char 'a' should be truthy") }

  let c2: char = c'\u0000'
  let r2: int = 0
  if (c2) { r2 = 99 }
  if (r2 != 0) { throw new Error("char null should be falsy") }

  let c3: char = c'0'
  let r3: int = 0
  if (c3) { r3 = 1 }
  if (r3 != 1) { throw new Error("char '0' should be truthy") }

  console.log("verified")
}
