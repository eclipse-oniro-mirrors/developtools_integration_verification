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
 * @id CON_06_04_017_RUNTIME_ENUM_TO_NUMERIC_VALUES
 * @expect runtime
 * @section 6.4
 * @design Enumeration to Numeric 运行时值保留
 * @note 运行时用例：实际执行验证枚举→数值转换的正确性
 */
enum Level {
  Low,
  Medium,
  High
}

function main(): void {
  let a: int = Level.Low
  if (a != 0) {
    throw new Error('assertion failed: Low should be 0, got ' + a)
  }

  let b: int = Level.Medium
  if (b != 1) {
    throw new Error('assertion failed: Medium should be 1')
  }

  let c: int = Level.High
  if (c != 2) {
    throw new Error('assertion failed: High should be 2')
  }

  let d: long = Level.High
  if (d != 2) {
    throw new Error('assertion failed: High→long should be 2')
  }

  console.log('Enum to numeric values verified')
}
