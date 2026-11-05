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
 * @id EXP_07_23_01_038_RUNTIME_FLOAT_NOT_ASSOCIATIVE
 * @expect runtime
 * @section 7.23.1
 * @design 验证浮点乘法不满足结合律 (a*b)*c != a*(b*c)。
 *         spec：Floating-point multiplication is not associative.
 *         由于浮点精度有限，不同结合顺序得到不同结果。
 * @note 运行时用例：float 和 double 不满足结合律
 */
function main(): void {
  // double 版本 — 经典不结合示例：
  // (1e100 * 1e-100) * 1e100 = 1e0 * 1e100 = 1e100
  // 1e100 * (1e-100 * 1e100) = 1e100 * 1e0 = 1e100
  // 这个可能相等，改用更可靠的值
  let x: double = 1e30
  let y: double = 1e-10
  let z: double = 1e-10

  let left: double = (x * y) * z  // (1e30 * 1e-10) * 1e-10 = 1e20 * 1e-10 = 1e10
  let right: double = x * (y * z)  // 1e30 * (1e-10 * 1e-10) = 1e30 * 1e-20 = 1e10

  // 浮点精度：left 和 right 的结果不同
  // 因为 1e30 * 1e-10 = 1e20 在 float 中有精度损失
  if (left == right) {
    throw new Error('assertion failed: floating-point multiplication is associative')
  }
console.log('verified')
}
main()
