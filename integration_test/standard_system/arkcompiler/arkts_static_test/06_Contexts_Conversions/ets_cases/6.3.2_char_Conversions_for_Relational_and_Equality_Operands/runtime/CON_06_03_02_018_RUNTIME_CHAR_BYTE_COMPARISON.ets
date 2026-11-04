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
 * @id CON_06_03_02_018_RUNTIME_CHAR_BYTE_COMPARISON
 * @expect runtime
 * @section 6.3.2
 * @design char vs byte 关系比较运行时行为：均 widening 为 int 后比较
 * @note 运行时用例：实际执行验证 char-byte 比较语义
 */
function main(): void {
  let c: char = c'A'
  let bSmall: byte = 60
  let bBig: byte = 70

  if (!(c > bSmall)) {
    throw new Error('assertion failed: 'A'(65) > 60 should be true')
  }
  if (c > bBig) {
    throw new Error('assertion failed: 'A'(65) > 70 should be false')
  }
  if (!(c < bBig)) {
    throw new Error('assertion failed: 'A'(65) < 70 should be true')
  }

  let bEqual: byte = 65
  if (!(c == bEqual)) {
    throw new Error('assertion failed: 'A'(65) == 65 should be true')
  }

  console.log('Char-byte comparison verified')
}
