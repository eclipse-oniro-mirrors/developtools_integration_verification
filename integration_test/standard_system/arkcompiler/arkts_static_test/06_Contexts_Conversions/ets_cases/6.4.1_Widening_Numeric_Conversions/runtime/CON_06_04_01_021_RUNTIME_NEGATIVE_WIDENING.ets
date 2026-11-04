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
 * @id CON_06_04_01_021_RUNTIME_NEGATIVE_WIDENING
 * @expect runtime
 * @section 6.4.1
 * @design 负数 widening 运行时值保留: byte(-1)→int, int(-100)→long/double
 * @note 运行时用例：实际执行验证负数 widening 不改变符号
 */
function main(): void {
  let b: byte = -1
  let i: int = b
  if (i != -1) {
    throw new Error('byte(-1)→int')
  }
  let l: long = b
  if (l != -1) {
    throw new Error('byte(-1)→long')
  }

  let negInt: int = -100
  let negLong: long = negInt
  if (negLong != -100) {
    throw new Error('int(-100)→long')
  }
  let negDouble: double = negInt
  if (negDouble != -100.0) {
    throw new Error('int(-100)→double')
  }

  console.log('Negative widening verified')
}
