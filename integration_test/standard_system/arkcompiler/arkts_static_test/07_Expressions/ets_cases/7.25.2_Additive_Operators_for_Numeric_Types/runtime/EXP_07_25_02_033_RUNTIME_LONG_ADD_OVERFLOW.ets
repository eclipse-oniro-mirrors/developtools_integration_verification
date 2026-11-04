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
 * @id EXP_07_25_02_033_RUNTIME_LONG_ADD_OVERFLOW
 * @expect runtime
 * @section 7.25.2
 * @design 验证 long+long 加法值正确和 long 溢出行为。
 *         spec：溢出时结果是低 64 位二进制补码表示。
 *         如果提升类型是 long，则执行整数算术。
 * @note 运行时用例：long 加法和溢出
 */
function main(): void {
  // long 基本加法
  let a: long = 500000000000
  let b: long = 300000000000
  let r1: long = a + b
  if (r1 != 800000000000) {
    throw new Error('500000000000+300000000000 should be 800000000000, got ' + r1)
  }

  // long 负数加法
  let r2: long = (-100000000000) + 40000000000
  if (r2 != -60000000000) {
    throw new Error('(-100000000000)+40000000000 should be -60000000000, got ' + r2)
  }

  let maxLong: long = 9223372036854775807
  let r3: long = maxLong + 1
  let expected3: long = -9223372036854775808
  if (r3 != expected3) {
    throw new Error('MAX_LONG+1 should be MIN_LONG, got ' + r3)
  }

  // 大数加法不溢出
  let r4: long = 1000000000000 + 2000000000000
  if (r4 != 3000000000000) {
    throw new Error('1000000000000+2000000000000 should be 3000000000000, got ' + r4)
  }
console.log('verified')
}
main()
