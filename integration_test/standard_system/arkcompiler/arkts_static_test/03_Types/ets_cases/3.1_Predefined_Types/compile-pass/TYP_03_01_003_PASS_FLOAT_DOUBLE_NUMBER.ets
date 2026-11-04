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
 * @id TYP_03_01_003_PASS_FLOAT_DOUBLE_NUMBER
 * @expect compile-pass
 * @section 3.1
 * @design float/double/number 声明、类型别名(Float/Double/Number)、f 后缀字面量、浮点算术运算、关系运算、widening(float→double)
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testFloatDouble(): void {
  let f: float = 3.14f
  let f2: Float = 0.0f
  let f3: float = -1.5f

  let d: double = 3.141592653589793
  let d2: Double = 0.0
  let n: number = 3.14
  let n2: Number = 1.0

  let sum: float = f + f2
  let sum2: double = d + n
  let diff: double = d - n
  let prod: double = d * f
  let quot: double = d / f
  let neg: double = -d

  let cmp1: boolean = d < n
  let cmp2: boolean = d == n
  let cmp3: boolean = d >= f

  let widened: double = f
  let n3: number = 1
}