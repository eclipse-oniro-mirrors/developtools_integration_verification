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
 * @id EXP_07_25_02_035_RUNTIME_INT_ASSOCIATIVE
 * @expect runtime
 * @section 7.25.2
 * @design 验证整数加法（同类型）满足结合律： (a+b)+c = a+(b+c)。
 *         spec：如果所有操作数类型相同，整数加法满足结合律。
 *         int 和 long 分别验证。
 * @note 运行时用例：整数加法结合律
 */
function main(): void {
  // int 同类型结合律
  let a: int = 7
  let b: int = 11
  let c: int = 13

  let left1: int = (a + b) + c
  let right1: int = a + (b + c)
  if (left1 != right1) {
    throw new Error('Int addition not associative: ' + left1 + ' != ' + right1)
  }
  if (left1 != 31) {
    throw new Error('7+11+13 should be 31, got ' + left1)
  }

  // int 溢出时结合律仍成立（低位截断一致性）
  let x: int = 2000000000
  let y: int = 1000000000
  let z: int = 500000000

  let left2: int = (x + y) + z
  let right2: int = x + (y + z)
  if (left2 != right2) {
    throw new Error('Overflow int addition should still be associative: ' + left2 + ' != ' + right2)
  }

  // long 同类型结合律
  let p: long = 100000000000
  let q: long = 200000000000
  let r: long = 300000000000

  let left3: long = (p + q) + r
  let right3: long = p + (q + r)
  if (left3 != right3) {
    throw new Error('Long addition not associative: ' + left3 + ' != ' + right3)
  }
  if (left3 != 600000000000) {
    throw new Error('100G+200G+300G should be 600G, got ' + left3)
  }
console.log('verified')
}
main()
