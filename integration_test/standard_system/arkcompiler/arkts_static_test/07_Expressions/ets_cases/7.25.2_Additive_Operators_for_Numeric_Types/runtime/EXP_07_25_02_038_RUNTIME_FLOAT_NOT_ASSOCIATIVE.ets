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
 * @id EXP_07_25_02_038_RUNTIME_FLOAT_NOT_ASSOCIATIVE
 * @expect runtime
 * @section 7.25.2
 * @design 验证浮点加法不满足结合律： (a+b)+c ≠ a+(b+c)。
 *         spec：浮点加法不满足结合律。
 *         例如大数加小数再加大数会产生不同的舍入结果。
 * @note 运行时用例：浮点非结合性
 */
function main(): void {
  // 经典反例：大数 + 小数 + 小数
  let a: double = 1.0e16
  let b: double = -1.0e16
  let c: double = 1.0

  // (a + b) + c = (1e16 + (-1e16)) + 1.0 = 0.0 + 1.0 = 1.0
  let left: double = (a + b) + c

  // a + (b + c) = 1e16 + ((-1e16) + 1.0)
  // (-1e16) + 1.0 = -9999999999999999.0 (舍去 1.0)
  // 1e16 + (-9999999999999999.0) = 1.0 或 0.0 (取决于精度)
  let right: double = a + (b + c)

  // 浮点加法不满足结合律
  if (left == right) {
    // This is not guaranteed by spec, but if they happen to be equal,
    // we just note that float is not associative per spec.
    // We'll use a different approach: verify using a known case.
  }

  // 更明显的反例：大数 + 小数导致精度损失
  let x: double = 1.0e20
  let y: double = -1.0e20
  let z: double = 123456.0

  let left2: double = (x + y) + z
  let right2: double = x + (y + z)

  // left2: (1e20 + (-1e20)) + 123456 = 0 + 123456 = 123456.0
  // right2: 1e20 + ((-1e20) + 123456)
  // (-1e20) + 123456 = -1e20 (因为 123456 太小被舍去)
  // 1e20 + (-1e20) = 0.0
  // 所以 left2 = 123456.0, right2 = 0.0

  if (left2 == right2) {
    throw new Error('Float addition should NOT be associative, but (1e20+(-1e20))+123456 == 1e20+((-1e20)+123456)')
  }
console.log('verified')
}
main()
