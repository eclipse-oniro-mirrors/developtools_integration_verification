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
 * @id EXP2_17_01_02_013_RUNTIME_CHAR_LT_CHAR_VERIFY
 * @expect runtime
 * @section 17.1.2
 * @design 验证 char < char 比较：c'a' < c'b' 为 true（spec 示例：c < c1）
 * @note 运行时用例：实际执行验证 char 之间比较的正确性
 */
function main(): void {
  let c1: char = c'a'
  let c2: char = c'b'
  let c3: char = c'z'
  // c'a' < c'b' should be true (0x61 < 0x62)
  if (!(c1 < c2)) {
    throw new Error('assertion failed: c'a' < c'b' should be true')
  }
  // c'b' > c'a' should be true
  if (!(c2 > c1)) {
    throw new Error('assertion failed: c'b' > c'a' should be true')
  }
  // c'a' <= c'a' should be true
  if (!(c1 <= c1)) {
    throw new Error('assertion failed: c'a' <= c'a' should be true')
  }
  // c'a' >= c'a' should be true
  if (!(c1 >= c1)) {
    throw new Error('assertion failed: c'a' >= c'a' should be true')
  }
  // c'A' < c'a' should be true (65 < 97)
  let cA: char = c'A'
  if (!(cA < c1)) {
    throw new Error('assertion failed: c'A' < c'a' should be true (65 < 97)')
  }
  // c'z' > c'a' should be true
  if (!(c3 > c1)) {
    throw new Error('assertion failed: c'z' > c'a' should be true')
  }
  console.log('verified')
}
