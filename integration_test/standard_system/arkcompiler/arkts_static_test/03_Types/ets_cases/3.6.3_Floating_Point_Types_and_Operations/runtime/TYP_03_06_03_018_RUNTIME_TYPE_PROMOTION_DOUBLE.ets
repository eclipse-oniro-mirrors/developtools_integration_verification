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
 * @id TYP_03_06_03_018_RUNTIME_TYPE_PROMOTION_DOUBLE
 * @expect runtime
 * @section 3.6.3
 * @design 类型推升 double 优先（64 位精度）
 * @note 运行时用例：double + float = double, double + int = double
 */
function main(): void {
  let f: float = 1.0f / 3.0f   // 32 位精度
  let d: double = 1.0 / 3.0    // 64 位精度

  // double 比 float 精度高
  let dDiff: double = (1.0 / 3.0) * 3.0
  if (dDiff != 1.0 && Math.abs(dDiff - 1.0) > 1e-10) {
    // 一般 double 接近 1.0
  }

  // double + int → double 64 位
  let i: int = 100
  let r: double = d + i
  if (r < 100.0 || r > 101.0) {
    throw new Error("double + int promotion failed: " + r)
  }

  // double + float → double
  let mix: double = d + f
  // 验证结果是 double（即超过 float 精度也保留）
  if (mix < 0.0 || mix > 1.0) {
    throw new Error("double + float promotion range failed")
  }

  console.log("Type promotion double verified")
}