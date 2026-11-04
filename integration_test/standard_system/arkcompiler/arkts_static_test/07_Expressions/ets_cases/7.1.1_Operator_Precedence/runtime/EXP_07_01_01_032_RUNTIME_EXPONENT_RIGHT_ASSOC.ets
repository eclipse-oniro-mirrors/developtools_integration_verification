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
 * @id EXP_07_01_01_032_RUNTIME_EXPONENT_RIGHT_ASSOC
 * @expect runtime
 * @section 7.1.1
 * @design 幂运算右结合：`2 ** 3 ** 2` = 2^(3^2) = 512（而非 (2^3)^2 = 64）
 * @note 运行时用例：验证幂运算右结合性
 */
function main(): void {
  let r: double = 2 ** 3 ** 2
  // 右结合: 2 ** (3 ** 2) = 2 ** 9 = 512
  if (r != 512) {
    throw new Error('assertion failed: 2**3**2 != 512, got ' + r)
  }
  let withParen: double = 2 ** (3 ** 2)
  if (withParen != 512) {
    throw new Error('assertion failed: 2**(3**2) != 512, got ' + withParen)
  }
  let leftAssoc: double = (2 ** 3) ** 2
  if (leftAssoc != 64) {
    throw new Error('assertion failed: (2**3)**2 != 64, got ' + leftAssoc)
  }
console.log('verified')
}
