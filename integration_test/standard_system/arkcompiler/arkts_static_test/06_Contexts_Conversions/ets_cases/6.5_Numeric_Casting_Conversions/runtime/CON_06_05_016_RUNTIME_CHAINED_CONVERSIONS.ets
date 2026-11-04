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
 * @id CON_06_05_016_RUNTIME_CHAINED_CONVERSIONS
 * @expect runtime
 * @section 6.5
 * @design 链式转换: double→int→long→double 的往返行为
 * @note 运行时用例：验证链式转换的值变化
 */
function main(): void {
  let d1: double = 3.14
  let i: int = d1.toInt()
  if (i != 3) {
    throw new Error('3.14.toInt() should be 3')
  }

  let l: long = i.toLong()
  if (l != 3) {
    throw new Error('3.toLong() should be 3')
  }

  let d2: double = l.toDouble()
  if (d2 != 3.0) {
    throw new Error('3.toDouble() should be 3.0')
  }

  let d3: double = -7.8
  let d4: double = d3.toInt().toLong().toDouble()
  if (d4 != -7.0) {
    throw new Error('-7.8→int→long→double should be -7.0')
  }

  console.log('Chained conversions verified')
}
