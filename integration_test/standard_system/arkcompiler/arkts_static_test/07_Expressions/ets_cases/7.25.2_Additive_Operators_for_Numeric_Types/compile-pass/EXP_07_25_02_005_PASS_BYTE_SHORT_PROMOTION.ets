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
 * @id EXP_07_25_02_005_PASS_BYTE_SHORT_PROMOTION
 * @expect compile-pass
 * @section 7.25.2
 * @design 验证 byte/short 在加减法中自动提升到 int。
 *         spec：如果操作数都不是 long 且存在非 int 类型，则提升到 int。
 * @note 正向用例：byte/short→int 自动提升
 */
function main(): void {
  let b1: byte = 10
  let b2: byte = 3
  let s1: short = 100
  let s2: short = 50

  // byte + byte → int
  let r1 = b1 + b2
  let t1 = typeof(r1)
  if (t1 != 'int') {
    throw new Error('byte+byte should be int, got ' + t1)
  }

  // byte - byte → int
  let r2 = b1 - b2
  let t2 = typeof(r2)
  if (t2 != 'int') {
    throw new Error('byte-byte should be int, got ' + t2)
  }

  // short + short → int
  let r3 = s1 + s2
  let t3 = typeof(r3)
  if (t3 != 'int') {
    throw new Error('short+short should be int, got ' + t3)
  }

  // short - short → int
  let r4 = s1 - s2
  let t4 = typeof(r4)
  if (t4 != 'int') {
    throw new Error('short-short should be int, got ' + t4)
  }

  // byte + short → int
  let r5 = b1 + s1
  let t5 = typeof(r5)
  if (t5 != 'int') {
    throw new Error('byte+short should be int, got ' + t5)
  }
console.log('verified')
}
main()
