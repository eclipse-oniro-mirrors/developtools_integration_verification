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
 * @id CON_06_03_02_025_RUNTIME_CHAR_NEGATIVE_COMPARISON
 * @expect runtime
 * @section 6.3.2
 * @design char 与负值 int/long 比较运行时行为
 * @note 运行时用例：char 为无符号类型(0-65535)，与负值比较 char 应更大
 */
function main(): void {
  let c: char = c'A'

  let negInt: int = -10
  if (!(c > negInt)) {
    throw new Error('assertion failed: 'A'(65) > -10 should be true')
  }
  if (c < negInt) {
    throw new Error('assertion failed: 'A'(65) < -10 should be false')
  }

  let negLong: long = -100
  if (!(c > negLong)) {
    throw new Error('assertion failed: 'A'(65) > -100 should be true')
  }

  let negDouble: double = -1.5
  if (!(c > negDouble)) {
    throw new Error('assertion failed: 'A'(65) > -1.5 should be true')
  }

  console.log('Char negative comparison verified')
}
