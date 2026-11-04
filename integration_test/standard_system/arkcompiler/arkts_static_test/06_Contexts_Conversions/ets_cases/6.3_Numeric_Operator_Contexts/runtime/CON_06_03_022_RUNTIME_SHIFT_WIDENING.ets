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
 * @id CON_06_03_022_RUNTIME_SHIFT_WIDENING
 * @expect runtime
 * @section 6.3
 * @design 移位运算 widening 运行时行为: int<<long, int>>byte
 * @note 运行时用例：实际执行验证 widening 移位结果
 */
function main(): void {
  let a: int = 1
  let b: long = 3
  let r1: long = a << b
  if (r1 != 8) {
    throw new Error('assertion failed: 1 << 3 should be 8, got ' + r1)
  }

  let r2: long = a >> b
  if (r2 != 0) {
    throw new Error('assertion failed: 1 >> 3 should be 0')
  }

  let c: int = 16
  let d: byte = 2
  let r3: int = c >> d
  if (r3 != 4) {
    throw new Error('assertion failed: 16 >> 2 should be 4')
  }

  let r4: int = c << d
  if (r4 != 64) {
    throw new Error('assertion failed: 16 << 2 should be 64')
  }

  console.log('Shift widening verified')
}
