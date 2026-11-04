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
 * @id EXP_07_25_02_007_PASS_CHAINED_ADDITIVE
 * @expect compile-pass
 * @section 7.25.2
 * @design 验证链式加减法 a+b-c+d 编译通过，左结合性。
 *         spec：加法运算符从左到右分组。
 * @note 正向用例：链式加减法编译通过
 */
function main(): void {
  let a: int = 100
  let b: int = 20
  let c: int = 30
  let d: int = 5

  // a + b - c + d  链式
  let r1 = a + b - c + d
  let t1 = typeof(r1)
  if (t1 != 'int') {
    throw new Error('chained int+int-int+int should be int, got ' + t1)
  }

  // 混合 long 链式
  let p: long = 100000
  let q: long = 20000
  let r2 = p + a - q
  let t2 = typeof(r2)
  if (t2 != 'long') {
    throw new Error('long+int-long should be long, got ' + t2)
  }

  // 混合 double 链式
  let x: double = 10.5
  let r3 = a + x - c
  let t3 = typeof(r3)
  if (t3 != 'double') {
    throw new Error('int+double-int should be double, got ' + t3)
  }
console.log('verified')
}
main()
