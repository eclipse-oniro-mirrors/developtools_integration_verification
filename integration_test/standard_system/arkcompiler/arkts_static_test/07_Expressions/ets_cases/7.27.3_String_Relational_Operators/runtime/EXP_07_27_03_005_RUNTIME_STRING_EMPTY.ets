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
 * @id EXP_07_27_03_005_RUNTIME_STRING_EMPTY
 * @expect runtime
 * @section 7.27.3
 * @design 验证空字符串参与字典序关系比较的运行时行为：空字符串小于任何非空字符串
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
  let empty: string = ''
  let nonEmpty: string = 'x'
  let anotherEmpty: string = ''

  // Empty string < any non-empty string
  if (!(empty < nonEmpty)) {
    throw new Error('"" < "x" should be true')
  }
  if (!(empty <= nonEmpty)) {
    throw new Error('"" <= "x" should be true')
  }

  // Non-empty string > empty string
  if (!(nonEmpty > empty)) {
    throw new Error('"x" > "" should be true')
  }
  if (!(nonEmpty >= empty)) {
    throw new Error('"x" >= "" should be true')
  }

  // Empty string is not greater than non-empty
  if (empty > nonEmpty) {
    throw new Error('"" > "x" should be false')
  }
  if (empty >= nonEmpty) {
    throw new Error('"" >= "x" should be false')
  }

  // Non-empty is not less than empty
  if (nonEmpty < empty) {
    throw new Error('"x" < "" should be false')
  }
  if (nonEmpty <= empty) {
    throw new Error('"x" <= "" should be false')
  }

  // Two empty strings are equal
  if (!(empty <= anotherEmpty)) {
    throw new Error('"" <= "" should be true')
  }
  if (!(empty >= anotherEmpty)) {
    throw new Error('"" >= "" should be true')
  }
  if (empty < anotherEmpty) {
    throw new Error('"" < "" should be false')
  }
  if (empty > anotherEmpty) {
    throw new Error('"" > "" should be false')
  }

  // Empty vs space character (space has code point 32)
  if (!(empty < ' ')) {
    throw new Error('"" < " " should be true')
  }
  if (!(' ' > empty)) {
    throw new Error('" " > "" should be true')
  }

  console.log('verified')
}
