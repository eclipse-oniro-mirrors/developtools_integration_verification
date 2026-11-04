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
 * @id CON_06_03_02_026_RUNTIME_PARAM_CHAR_ALL_TYPES
 * @expect runtime
 * @section 6.3.2
 * @design 通过函数参数传入 char 与所有数值类型比较的综合运行时行为
 * @note 运行时用例：与 spec 示例一致，全面验证 char 转换
 */
function compareAll(c: char, b: byte, i: int, l: long, d: double): void {
  if (!(c < i)) {
    throw new Error('assertion failed: char < int')
  }
  if (!(c < l)) {
    throw new Error('assertion failed: char < long')
  }
  if (!(c < d)) {
    throw new Error('assertion failed: char < double')
  }
  if (c > d) {
    throw new Error('assertion failed: char should not be > double')
  }
  if (c < b) {
    throw new Error('assertion failed: char should not be < byte')
  }
  if (!(c > b)) {
    throw new Error('assertion failed: char > byte')
  }
}

function main(): void {
  compareAll(c'a', 90, 200, 300, 400.0)

  console.log('Param char all-types comparison verified')
}
