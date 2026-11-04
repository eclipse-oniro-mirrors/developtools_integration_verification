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
 * @id CON_06_03_025_RUNTIME_COMPOUND_ASSIGNMENT
 * @expect runtime
 * @section 6.3
 * @design 复合赋值 widening 运行时行为: += -= *= /= <<= >>=
 * @note 运行时用例：实际执行验证复合赋值 widening 结果
 */
function main(): void {
  let a: long = 100
  a += 10
  if (a != 110) {
    throw new Error('assertion failed: 100 += 10 should be 110')
  }

  let b: long = 200
  b -= 50
  if (b != 150) {
    throw new Error('assertion failed: 200 -= 50 should be 150')
  }

  let c: double = 2.0
  c *= 3
  if (c != 6.0) {
    throw new Error('assertion failed: 2.0 *= 3 should be 6.0')
  }

  let d: double = 10.0
  d /= 4
  if (d != 2.5) {
    throw new Error('assertion failed: 10.0 /= 4 should be 2.5')
  }

  let e: long = 1
  e <<= 3
  if (e != 8) {
    throw new Error('assertion failed: 1 <<= 3 should be 8, got ' + e)
  }

  e >>= 2
  if (e != 2) {
    throw new Error('assertion failed: 8 >>= 2 should be 2')
  }

  console.log('Compound assignment verified')
}
