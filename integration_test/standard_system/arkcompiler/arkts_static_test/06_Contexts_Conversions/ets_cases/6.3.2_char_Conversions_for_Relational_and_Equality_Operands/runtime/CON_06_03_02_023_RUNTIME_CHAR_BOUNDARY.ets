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
 * @id CON_06_03_02_023_RUNTIME_CHAR_BOUNDARY
 * @expect runtime
 * @section 6.3.2
 * @design char 边界值: 极小/极大 char 值与 int 比较
 * @note 运行时用例：实际执行验证 char 边界值比较语义
 */
function main(): void {
  let low: char = c'\u0000'
  let high: char = c'\uffff'

  let zero: int = 0
  if (!(low == zero)) {
    throw new Error('assertion failed: '\\u0000' == 0 should be true')
  }
  if (low > zero) {
    throw new Error('assertion failed: '\\u0000' > 0 should be false')
  }

  if (!(high > zero)) {
    throw new Error('assertion failed: '\\uffff' > 0 should be true')
  }

  let diff: char = c' '
  let spaceCode: int = 32
  if (!(diff == spaceCode)) {
    throw new Error('assertion failed: ' ' == 32 should be true')
  }

  console.log('Char boundary comparison verified')
}
