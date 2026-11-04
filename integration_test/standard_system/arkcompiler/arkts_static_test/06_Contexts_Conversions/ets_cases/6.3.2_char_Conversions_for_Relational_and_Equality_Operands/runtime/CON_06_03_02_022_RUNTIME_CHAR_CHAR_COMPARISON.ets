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
 * @id CON_06_03_02_022_RUNTIME_CHAR_CHAR_COMPARISON
 * @expect runtime
 * @section 6.3.2
 * @design char vs char 关系比较运行时行为：均 widening 为 int
 * @note 运行时用例：实际执行验证 char-char 比较语义
 */
function main(): void {
  let a: char = c'A'
  let b: char = c'B'
  let c2: char = c'A'

  if (!(a < b)) {
    throw new Error('assertion failed: 'A' < 'B' should be true')
  }
  if (a > b) {
    throw new Error('assertion failed: 'A' > 'B' should be false')
  }
  if (!(a == c2)) {
    throw new Error('assertion failed: 'A' == 'A' should be true')
  }
  if (a != c2) {
    throw new Error('assertion failed: 'A' != 'A' should be false')
  }
  if (a == b) {
    throw new Error('assertion failed: 'A' != 'B' should be true')
  }

  console.log('Char-char comparison verified')
}
