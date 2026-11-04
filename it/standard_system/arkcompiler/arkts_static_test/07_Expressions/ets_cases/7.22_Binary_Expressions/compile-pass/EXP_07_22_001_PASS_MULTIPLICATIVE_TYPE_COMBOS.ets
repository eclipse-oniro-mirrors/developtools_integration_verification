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
 * @id EXP_07_22_001_PASS_MULTIPLICATIVE_TYPE_COMBOS
 * @expect compile-pass
 * @section 7.22
 * @design 验证乘法运算符 * / % 的类型组合表规则：
 *          byte*byte→int, int*int→int,
 *          long*int→long, float*int→float,
 *          double*int→double
 * @note 正向用例：验证乘法运算符支持所有数值类型组合，
 *        结果类型遵循最大类型规则
 */
function main(): void {
  let a: byte = 3
  let b: byte = 2
  let c: int = 10
  let d: long = 100
  let e: float = 2.5 as float
  let f: double = 3.5

  // byte * byte → int
  let r1 = a * b
  let r1Type = typeof(r1)
  if (r1Type != 'int') {
    throw new Error('byte*byte should be int, got ' + r1Type)
  }

  // int * int → int
  let r2 = c * c
  let r2Type = typeof(r2)
  if (r2Type != 'int') {
    throw new Error('int*int should be int, got ' + r2Type)
  }

  // long * int → long
  let r3 = d * c
  let r3Type = typeof(r3)
  if (r3Type != 'long') {
    throw new Error('long*int should be long, got ' + r3Type)
  }

  // float * int → float
  let r4 = e * c
  let r4Type = typeof(r4)
  if (r4Type != 'float') {
    throw new Error('float*int should be float, got ' + r4Type)
  }

  // double * int → double (typeof => "number")
  let r5 = f * c
  let r5Type = typeof(r5)
  if (r5Type != 'number') {
    throw new Error('double*int should be number, got ' + r5Type)
  }

  // double * float → double (typeof => "number")
  let r6 = f * e
  let r6Type = typeof(r6)
  if (r6Type != 'number') {
    throw new Error('double*float should be number, got ' + r6Type)
  }
console.log('verified')
}
main()
