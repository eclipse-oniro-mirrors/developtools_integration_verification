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
 * @id CON_06_04_01_017_RUNTIME_SHORT_WIDENING
 * @expect runtime
 * @section 6.4.1
 * @design short→int/long/float/double 运行时值保留
 * @note 运行时用例：实际执行验证 short widening 不丢失值
 */
function main(): void {
  let s: short = 100
  let i: int = s
  if (i != 100) {
    throw new Error('short→int')
  }
  let l: long = s
  if (l != 100) {
    throw new Error('short→long')
  }
  let f: float = s
  if (f != 100) {
    throw new Error('short→float')
  }
  let d: double = s
  if (d != 100.0) {
    throw new Error('short→double')
  }
  console.log('Short widening verified')
}
