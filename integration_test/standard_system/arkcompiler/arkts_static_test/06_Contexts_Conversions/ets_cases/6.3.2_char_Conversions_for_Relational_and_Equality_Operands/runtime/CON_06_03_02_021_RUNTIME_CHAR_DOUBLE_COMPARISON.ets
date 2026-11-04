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
 * @id CON_06_03_02_021_RUNTIME_CHAR_DOUBLE_COMPARISON
 * @expect runtime
 * @section 6.3.2
 * @design char vs double 关系比较运行时行为：char widening 为 double
 * @note 运行时用例：实际执行验证 char-double 比较语义
 */
function main(): void {
  let c: char = c'A'
  let dSmall: double = 60.0
  let dBig: double = 70.5

  if (!(c > dSmall)) {
    throw new Error('assertion failed: 'A'(65) > 60.0 should be true')
  }
  if (!(c < dBig)) {
    throw new Error('assertion failed: 'A'(65) < 70.5 should be true')
  }

  let dEqual: double = 65.0
  if (!(c == dEqual)) {
    throw new Error('assertion failed: 'A'(65) == 65.0 should be true')
  }

  console.log('Char-double comparison verified')
}
