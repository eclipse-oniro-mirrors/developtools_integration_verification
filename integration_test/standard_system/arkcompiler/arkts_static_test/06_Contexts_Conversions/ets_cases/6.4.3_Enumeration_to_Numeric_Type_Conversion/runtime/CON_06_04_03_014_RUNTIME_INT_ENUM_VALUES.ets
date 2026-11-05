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
 * @id CON_06_04_03_014_RUNTIME_INT_ENUM_VALUES
 * @expect runtime
 * @section 6.4.3
 * @design int 基类型枚举→int/long/double 运行时值保留
 * @note 运行时用例：验证枚举值转换结果
 */
enum IntegerEnum { a, b, c }

function main(): void {
  let e: IntegerEnum = IntegerEnum.b
  let vi: int = e
  if (vi != 1) {
    throw new Error('assertion: enum→int should be 1, got ' + vi)
  }

  let vl: long = e
  if (vl != 1) {
    throw new Error('assertion: enum→long should be 1')
  }

  let vd: double = e
  if (vd != 1.0) {
    throw new Error('assertion: enum→double should be 1.0')
  }

  let e2: IntegerEnum = IntegerEnum.a
  let vz: int = e2
  if (vz != 0) {
    throw new Error('assertion: enum a→int should be 0')
  }

  let e3: IntegerEnum = IntegerEnum.c
  let vc: int = e3
  if (vc != 2) {
    throw new Error('assertion: enum c→int should be 2')
  }

  console.log('Int enum values verified')
}
