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
 * @id TYP_03_06_01_016_RUNTIME_BOUNDARY_VALUES
 * @expect runtime
 * @section 3.6.1
 * @design 各数值类型边界值运行时正确保留
 * @note 运行时用例：实测边界值精度
 */
function main(): void {
  let bMax: byte = 127
  let bMin: byte = -128
  if (bMax != 127 || bMin != -128) {
    throw new Error("byte boundary failed")
  }

  let sMax: short = 32767
  let sMin: short = -32768
  if (sMax != 32767 || sMin != -32768) {
    throw new Error("short boundary failed")
  }

  let iMax: int = 2147483647
  let iMin: int = -2147483648
  if (iMax != 2147483647 || iMin != -2147483648) {
    throw new Error("int boundary failed")
  }

  let lMax: long = 9223372036854775807
  if (lMax != 9223372036854775807) {
    throw new Error("long max failed")
  }

  console.log("Boundary values verified")
}