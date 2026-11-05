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
 * @id LEX_02_08_023_RUNTIME_EQUALITY_RESULT
 * @expect runtime
 * @section 2.8
 * @design 相等性运算符 == != === !== 运行时结果
 * @note 运行时用例：实际执行验证语义正确性
 */
function main(): void {
  let a: number = 5
  let b: number = 5
  let c: number = 6
  if (!(a === b)) { throw new Error("=== failed") }
  if (a === c) { throw new Error("=== wrong on diff") }
  if (!(a !== c)) { throw new Error("!== failed") }
  if (!(a == b)) { throw new Error("== failed") }
  if (a != b) { throw new Error("!= wrong on equal") }
}
