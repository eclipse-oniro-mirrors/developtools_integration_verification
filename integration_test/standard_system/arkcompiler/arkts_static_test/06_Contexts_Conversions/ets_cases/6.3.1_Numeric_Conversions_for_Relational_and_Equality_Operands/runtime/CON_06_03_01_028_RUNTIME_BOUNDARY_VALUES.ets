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
 * @id CON_06_03_01_028_RUNTIME_BOUNDARY_VALUES
 * @expect runtime
 * @section 6.3.1
 * @design 边界值（零、等值、大值）在 widening 比较中的运行时行为
 * @note 运行时用例：实际执行验证边界条件下的比较语义
 */
function main(): void {
  let zeroInt: int = 0
  let zeroLong: long = 0
  if (!(zeroInt == zeroLong)) {
    throw new Error('assertion failed: 0 == 0 should be true')
  }
  if (zeroInt != zeroLong) {
    throw new Error('assertion failed: 0 != 0 should be false')
  }
  if (zeroInt < zeroLong) {
    throw new Error('assertion failed: 0 < 0 should be false')
  }
  if (zeroInt > zeroLong) {
    throw new Error('assertion failed: 0 > 0 should be false')
  }

  let bigInt: int = 1000000
  let smallLong: long = 100
  if (!(bigInt > smallLong)) {
    throw new Error('assertion failed: 1000000 > 100 should be true')
  }

  let sameInt: int = 42
  let sameLong: long = 42
  if (!(sameInt == sameLong)) {
    throw new Error('assertion failed: 42 == 42 should be true')
  }
  if (sameInt > sameLong) {
    throw new Error('assertion failed: 42 > 42 should be false')
  }
  if (sameInt < sameLong) {
    throw new Error('assertion failed: 42 < 42 should be false')
  }
  if (!(sameInt >= sameLong)) {
    throw new Error('assertion failed: 42 >= 42 should be true')
  }
  if (!(sameInt <= sameLong)) {
    throw new Error('assertion failed: 42 <= 42 should be true')
  }

  console.log('Boundary value comparison verified')
}
