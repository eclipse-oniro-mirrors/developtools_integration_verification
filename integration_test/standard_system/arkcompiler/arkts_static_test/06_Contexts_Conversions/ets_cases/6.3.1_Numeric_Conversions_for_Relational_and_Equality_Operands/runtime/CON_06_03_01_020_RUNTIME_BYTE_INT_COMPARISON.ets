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
 * @id CON_06_03_01_020_RUNTIME_BYTE_INT_COMPARISON
 * @expect runtime
 * @section 6.3.1
 * @design byte 与 int 的关系比较运行时行为：byte widening 为 int
 * @note 运行时用例：实际执行验证 byte < int 的语义正确性
 */
function main(): void {
  let a: byte = 5
  let b: int = 10

  if (!(a < b)) {
    throw new Error('assertion failed: 5 < 10 should be true')
  }
  if (a > b) {
    throw new Error('assertion failed: 5 > 10 should be false')
  }
  if (!(a <= b)) {
    throw new Error('assertion failed: 5 <= 10 should be true')
  }
  if (a >= b) {
    throw new Error('assertion failed: 5 >= 10 should be false')
  }

  console.log('Byte-int relational comparison verified')
}
