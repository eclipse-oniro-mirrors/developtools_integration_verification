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
 * @id TYP_03_01_030_RUNTIME_NAN_INFINITY
 * @expect runtime
 * @section 3.1
 * @design 浮点 0/0=NaN, 1/0=Infinity, NaN!=自身
 * @note 运行时用例：实际执行验证 IEEE 754 NaN/Infinity 行为
 */
function main(): void {
  let zero: double = 0.0
  let nan: double = zero / zero
  let inf: double = 1.0 / zero
  let negInf: double = -1.0 / zero

  // NaN 不等于自身
  if (nan == nan) {
    throw new Error("NaN should not equal itself")
  }

  // Infinity 与正常数比较
  if (!(inf > 1e308)) {
    throw new Error("Infinity should be greater than any finite number")
  }

  if (!(negInf < -1e308)) {
    throw new Error("Negative infinity should be less than any finite number")
  }

  // NaN 任意运算仍是 NaN
  let result: double = nan + 1.0
  if (result == result) {
    throw new Error("NaN+1 should still be NaN")
  }

  console.log("NaN/Infinity behavior verified")
}