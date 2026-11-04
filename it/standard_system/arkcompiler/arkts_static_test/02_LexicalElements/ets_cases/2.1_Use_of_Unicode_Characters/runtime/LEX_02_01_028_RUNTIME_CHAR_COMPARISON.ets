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
 * @id LEX_02_01_028_RUNTIME_CHAR_COMPARISON
 * @expect runtime
 * @section 2.1
 * @design char运行时等值比较: ==, ===, !=, !== * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let a: char = c'A'
  let b: char = c'\u0041'
  if (a != b) { throw new Error("char == should be true") }
  if (a !== b) { throw new Error("char === should be true") }

  let c: char = c'B'
  if (a == c) { throw new Error("char == different should be false") }
  if (a === c) { throw new Error("char === different should be false") }
  if (a != c === false) { throw new Error("char != should be true") }
}
