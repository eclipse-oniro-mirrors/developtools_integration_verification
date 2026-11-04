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
 * @id EXP_07_01_01_029_RUNTIME_BITWISE_CHAIN
 * @expect runtime
 * @section 7.1.1
 * @design 按位与 `&` 优先于异或 `^` 优先于或 `|`：`1 | 2 & 3 ^ 4`
 * @note 运行时用例：验证按位运算符优先级链
 */
function main(): void {
  let r1: int = 1 | 2 & 3 ^ 4
  // 2 & 3 = 2, 2 ^ 4 = 6, 1 | 6 = 7
  if (r1 != 7) {
    throw new Error('assertion failed: 1|2&3^4 != 7, got ' + r1)
  }
  let r2: int = 5 ^ 3 & 6 | 2
  // 3&6=2, 5^2=7, 7|2=7
  if (r2 != 7) {
    throw new Error('assertion failed: 5^3&6|2 != 7, got ' + r2)
  }
  let r3: int = 7 & 3 | 4 ^ 2
  // 7&3=3, 4^2=6, 3|6=7
  if (r3 != 7) {
    throw new Error('assertion failed: 7&3|4^2 != 7, got ' + r3)
  }
console.log('verified')
}
