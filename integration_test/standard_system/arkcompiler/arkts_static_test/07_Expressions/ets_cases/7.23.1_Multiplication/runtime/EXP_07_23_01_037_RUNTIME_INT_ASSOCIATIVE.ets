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
 * @id EXP_07_23_01_037_RUNTIME_INT_ASSOCIATIVE
 * @expect runtime
 * @section 7.23.1
 * @design 验证整数（同类型）乘法满足结合律。
 *         spec：Integer multiplication is associative when all
 *         operands are of the same type.
 * @note 运行时用例：int 同类型结合律、long 同类型结合律
 */
function main(): void {
  // int 同类型结合律
  let a: int = 7
  let b: int = 11
  let c: int = 13

  let left1: int = (a * b) * c
  let right1: int = a * (b * c)
  if (left1 != right1) {
    throw new Error('Int multiplication not associative: ' + left1 + ' != ' + right1)
  }
  if (left1 != 1001) {
    throw new Error('7 * 11 * 13 should be 1001, got ' + left1)
  }

  // int 溢出时结合律仍成立（低位截断一致性）
  let x: int = 100000
  let y: int = 50000
  let z: int = 30000

  let left2: int = (x * y) * z
  let right2: int = x * (y * z)
  if (left2 != right2) {
    throw new Error('Int overflow multiplication should still be associative: ' + left2 + ' != ' + right2)
  }

  // long 同类型结合律
  let p: long = 100
  let q: long = 200
  let r: long = 300

  let left3: long = (p * q) * r
  let right3: long = p * (q * r)
  if (left3 != right3) {
    throw new Error('Long multiplication not associative: ' + left3 + ' != ' + right3)
  }
  if (left3 != 6000000) {
    throw new Error('100 * 200 * 300 should be 6000000, got ' + left3)
  }
console.log('verified')
}
main()
