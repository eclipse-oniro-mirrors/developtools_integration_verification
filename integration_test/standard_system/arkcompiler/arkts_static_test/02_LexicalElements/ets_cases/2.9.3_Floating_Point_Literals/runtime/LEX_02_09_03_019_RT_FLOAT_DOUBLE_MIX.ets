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
 * @id LEX_02_09_03_019_RT_FLOAT_DOUBLE_MIX
 * @expect runtime
 * @section 2.9.3
 * @design float 与 double 混合运算验证
 * @note runtime 用例：验证 float 与 double 混合运算
 */

function main(): void {
  // 验证 float 与 double 混合运算
  let x1: float = 3.14f
  let x2: double = 2.718281828

  // float 自动提升为 double
  let sum: double = x1 + x2
  // 验证结果在合理范围内
  if (sum < 5.85 || sum > 5.87) {
    throw new Error("float + double failed, got " + sum)
  }

  // 验证 double 赋值给 float（使用 Double.toFloat()）
  let x3: double = 3.141592653589793
  let x4: float = Double.toFloat(x3)
  // 验证结果在合理范围内
  if (x4 < 3.14f || x4 > 3.15f) {
    throw new Error("double to float conversion failed, got " + x4)
  }
}
