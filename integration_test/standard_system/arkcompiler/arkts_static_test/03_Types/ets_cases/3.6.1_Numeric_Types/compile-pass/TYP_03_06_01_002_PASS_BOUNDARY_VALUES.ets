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
 * @id TYP_03_06_01_002_PASS_BOUNDARY_VALUES
 * @expect compile-pass
 * @section 3.6.1
 * @design 数值类型边界值
 * @note 正向用例：每种类型的最大/最小值
 */
function testBoundaryValues(): void {
  let bMax: byte = 127
  let bMin: byte = -128

  let sMax: short = 32767
  let sMin: short = -32768

  let iMax: int = 2147483647
  let iMin: int = -2147483648

  let lMax: long = 9223372036854775807
  let lMin: long = -9223372036854775808
}