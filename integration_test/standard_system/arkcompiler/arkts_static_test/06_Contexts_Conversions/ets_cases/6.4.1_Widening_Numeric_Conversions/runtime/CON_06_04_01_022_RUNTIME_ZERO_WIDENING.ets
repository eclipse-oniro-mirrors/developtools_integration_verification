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
 * @id CON_06_04_01_022_RUNTIME_ZERO_WIDENING
 * @expect runtime
 * @section 6.4.1
 * @design 零值 widening: 各类零值的 widening 应保持为 0
 * @note 运行时用例：实际执行验证零值 widening
 */
function main(): void {
  let b: byte = 0
  let iFromByte: int = b
  if (iFromByte != 0) {
    throw new Error('byte 0→int')
  }

  let s: short = 0
  let iFromShort: int = s
  if (iFromShort != 0) {
    throw new Error('short 0→int')
  }

  let i: int = 0
  let l: long = i
  if (l != 0) {
    throw new Error('int 0→long')
  }
  let d: double = i
  if (d != 0.0) {
    throw new Error('int 0→double')
  }

  console.log('Zero widening verified')
}
