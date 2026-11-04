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
 * @id CON_06_03_02_020_RUNTIME_CHAR_LONG_COMPARISON
 * @expect runtime
 * @section 6.3.2
 * @design char vs long 关系比较运行时行为：char widening 为 long
 * @note 运行时用例：实际执行验证 char-long 比较语义
 */
function main(): void {
  let c: char = c'0'
  let lSmall: long = 40
  let lBig: long = 50

  if (!(c > lSmall)) {
    throw new Error('assertion failed: '0'(48) > 40 should be true')
  }
  if (!(c < lBig)) {
    throw new Error('assertion failed: '0'(48) < 50 should be true')
  }

  let lEqual: long = 48
  if (!(c == lEqual)) {
    throw new Error('assertion failed: '0'(48) == 48 should be true')
  }
  if (c != lEqual) {
    throw new Error('assertion failed: '0'(48) != 48 should be false')
  }

  console.log('Char-long comparison verified')
}
