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
 * @id EXP_07_25_02_004_PASS_INT_DOUBLE_PROMOTION
 * @expect compile-pass
 * @section 7.25.2
 * @design 验证 int+double→double、long+double→double 提升到最大类型 double。
 *         spec：结果类型是转换为后最大的类型，double 是最大数值类型。
 * @note 正向用例：int/long→double 提升
 */
function main(): void {
  let i: int = 42
  let l: long = 123456789
  let d: double = 3.14159265358979

  // int + double → double
  let r1 = i + d
  let t1 = typeof(r1)
  if (t1 != 'double') {
    throw new Error('int+double should be double, got ' + t1)
  }

  // double + int → double
  let r2 = d + i
  let t2 = typeof(r2)
  if (t2 != 'double') {
    throw new Error('double+int should be double, got ' + t2)
  }

  // long + double → double
  let r3 = l + d
  let t3 = typeof(r3)
  if (t3 != 'double') {
    throw new Error('long+double should be double, got ' + t3)
  }

  // int - double → double
  let r4 = i - d
  let t4 = typeof(r4)
  if (t4 != 'double') {
    throw new Error('int-double should be double, got ' + t4)
  }
console.log('verified')
}
main()
