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
 * @id CON_06_03_021_RUNTIME_MULTIPLICATIVE_WIDENING
 * @expect runtime
 * @section 6.3
 * @design 乘法/除法/取模 widening 运行时行为: int*double, int*long, int/long
 * @note 运行时用例：实际执行验证 widening 乘法结果
 */
function main(): void {
  let a: int = 4
  let b: double = 2.5
  let r1: double = a * b
  if (r1 != 10.0) {
    throw new Error('assertion failed: 4 * 2.5 should be 10.0, got ' + r1)
  }

  let c: int = 3
  let d: long = 100
  let r2: long = c * d
  if (r2 != 300) {
    throw new Error('assertion failed: 3 * 100 should be 300')
  }

  let e: int = 10
  let f: int = 3
  let r3: int = e % f
  if (r3 != 1) {
    throw new Error('assertion failed: 10 % 3 should be 1')
  }

  let g: int = 7
  let h: int = 2
  let r4: int = g / h
  if (r4 != 3) {
    throw new Error('assertion failed: 7 / 2 should be 3 (integer division)')
  }

  console.log('Multiplicative widening verified')
}
