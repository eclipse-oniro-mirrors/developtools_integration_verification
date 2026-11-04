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
 * @id EXP_07_36_01_004_RUNTIME_CONST_ARITHMETIC
 * @expect runtime
 * @section 7.36.1
 * @design 验证编译时整型常量表达式求值结果在运行时正确
 * @note 运行时用例：常量折叠产生的值在运行时与预期一致
 */

// 编译时求值的常量
const a: int = 10 + 20
const b: int = 100 * 5
const c: int = 1000 / 10
const d: int = 100 % 30
const e: int = (10 + 20) * 2
const f: int = 1 << 4
const g: int = 64 >> 3
const h: int = 256 >>> 2
const i: int = 0xFF & 0x0F
const j: int = 0xF0 | 0x0F
const k: int = 0xFF ^ 0xF0
const l: int = -42
const m: int = ~0xFF

function main(): void {
  if (a != 30) {
    throw new Error('assertion failed 1: 10+20 expected 30, got ' + a)
  }
  if (b != 500) {
    throw new Error('assertion failed 2: 100*5 expected 500, got ' + b)
  }
  if (c != 100) {
    throw new Error('assertion failed 3: 1000/10 expected 100, got ' + c)
  }
  if (d != 10) {
    throw new Error('assertion failed 4: 100%30 expected 10, got ' + d)
  }
  if (e != 60) {
    throw new Error('assertion failed 5: (10+20)*2 expected 60, got ' + e)
  }
  if (f != 16) {
    throw new Error('assertion failed 6: 1<<4 expected 16, got ' + f)
  }
  if (g != 8) {
    throw new Error('assertion failed 7: 64>>3 expected 8, got ' + g)
  }
  if (h != 64) {
    throw new Error('assertion failed 8: 256>>>2 expected 64, got ' + h)
  }
  if (i != 15) {
    throw new Error('assertion failed 9: 0xFF&0x0F expected 15, got ' + i)
  }
  if (j != 255) {
    throw new Error('assertion failed 10: 0xF0|0x0F expected 255, got ' + j)
  }
  if (k != 15) {
    throw new Error('assertion failed 11: 0xFF^0xF0 expected 15, got ' + k)
  }
  if (l != -42) {
    throw new Error('assertion failed 12: -42 expected -42, got ' + l)
  }
  if (m != -256) {
    throw new Error('assertion failed 13: ~0xFF expected -256, got ' + m)
  }
console.log('verified')
}
