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
 * @id EXP_07_01_01_027_RUNTIME_SHIFT_ARITH_MIXED
 * @expect runtime
 * @section 7.1.1
 * @design 移位和算术混合：`1 + 2 << 3 - 1` = 3 << 2 = 12
 * @note 运行时用例：验证加法优先于移位
 */
function main(): void {
  let r1: int = 1 + 2 << 3 - 1
  if (r1 != 12) {
    throw new Error('assertion failed: 1+2<<3-1 != 12, got ' + r1)
  }
  let r2: int = 16 >> 2 + 1
  if (r2 != 2) {
    throw new Error('assertion failed: 16>>2+1 != 2, got ' + r2)
  }
  let r3: int = 8 >>> 1 + 1
  if (r3 != 2) {
    throw new Error('assertion failed: 8>>>1+1 != 2, got ' + r3)
  }
console.log('verified')
}
