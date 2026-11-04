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
 * @id CON_06_04_01_023_RUNTIME_FULL_TABLE
 * @expect runtime
 * @section 6.4.1
 * @design 完整转换表验证: 所有 15 条 widening 路径
 * @note 运行时用例：实际执行验证全部转换表
 */
function main(): void {
  let b: byte = 7
  let s: short = 8
  let i: int = 9
  let l: long = 10
  let i2: int = 11
  let f: float = i2
  // byte→5 targets
  let bToS: short = b
  if (bToS != 7) {
    throw new Error('byte→short')
  }
  let bToI: int = b
  if (bToI != 7) {
    throw new Error('byte→int')
  }
  let bToL: long = b
  if (bToL != 7) {
    throw new Error('byte→long')
  }
  let bToF: float = b
  if (bToF != 7) {
    throw new Error('byte→float')
  }
  let bToD: double = b
  if (bToD != 7.0) {
    throw new Error('byte→double')
  }
  // short→4 targets
  let sToI: int = s
  if (sToI != 8) {
    throw new Error('short→int')
  }
  let sToL: long = s
  if (sToL != 8) {
    throw new Error('short→long')
  }
  let sToF: float = s
  if (sToF != 8) {
    throw new Error('short→float')
  }
  let sToD: double = s
  if (sToD != 8.0) {
    throw new Error('short→double')
  }
  // int→3 targets
  let iToL: long = i
  if (iToL != 9) {
    throw new Error('int→long')
  }
  let iToF: float = i
  if (iToF != 9) {
    throw new Error('int→float')
  }
  let iToD: double = i
  if (iToD != 9.0) {
    throw new Error('int→double')
  }
  // long→2 targets
  let lToF: float = l
  if (lToF != 10) {
    throw new Error('long→float')
  }
  let lToD: double = l
  if (lToD != 10.0) {
    throw new Error('long→double')
  }
  // float→1 target
  let fToD: double = f
  if (fToD != 11.0) {
    throw new Error('float→double')
  }
  console.log('Full widening table verified')
}
