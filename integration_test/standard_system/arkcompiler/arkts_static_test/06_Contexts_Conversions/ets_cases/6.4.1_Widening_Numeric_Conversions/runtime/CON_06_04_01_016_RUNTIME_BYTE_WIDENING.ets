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
 * @id CON_06_04_01_016_RUNTIME_BYTE_WIDENING
 * @expect runtime
 * @section 6.4.1
 * @design byte→short/int/long/float/double 运行时值保留
 * @note 运行时用例：实际执行验证 byte widening 不丢失值
 */
function main(): void {
  let b: byte = 42
  let s: short = b
  if (s != 42) {
    throw new Error('byte→short: ' + s)
  }
  let i: int = b
  if (i != 42) {
    throw new Error('byte→int: ' + i)
  }
  let l: long = b
  if (l != 42) {
    throw new Error('byte→long: ' + l)
  }
  let f: float = b
  if (f != 42) {
    throw new Error('byte→float: ' + f)
  }
  let d: double = b
  if (d != 42.0) {
    throw new Error('byte→double: ' + d)
  }
  console.log('Byte widening verified')
}
