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
 * @id EXP_07_22_013_PASS_BITWISE_AND_XOR_OR
 * @expect compile-pass
 * @section 7.22
 * @design 验证位运算符 & / ^ / | 的类型组合：
 *          boolean&boolean→boolean, int|int→int,
 *          long^long→long, int&int→int, int^int→int
 * @note 正向用例：位运算符支持 boolean 和数值类型
 */
function main(): void {
  let a: int = 5
  let b: int = 3
  let c: long = 100
  let d: long = 50
  let e: boolean = true
  let f: boolean = false

  // boolean & boolean → boolean
  let r1 = e & f
  let r1Type = typeof(r1)
  if (r1Type != 'boolean') {
    throw new Error('boolean&boolean should be boolean, got ' + r1Type)
  }

  // boolean | boolean → boolean
  let r2 = e | f
  let r2Type = typeof(r2)
  if (r2Type != 'boolean') {
    throw new Error('boolean|boolean should be boolean, got ' + r2Type)
  }

  // boolean ^ boolean → boolean
  let r3 = e ^ f
  let r3Type = typeof(r3)
  if (r3Type != 'boolean') {
    throw new Error('boolean^boolean should be boolean, got ' + r3Type)
  }

  // int | int → int
  let r4 = a | b
  let r4Type = typeof(r4)
  if (r4Type != 'int') {
    throw new Error('int|int should be int, got ' + r4Type)
  }

  // int & int → int
  let r5 = a & b
  let r5Type = typeof(r5)
  if (r5Type != 'int') {
    throw new Error('int&int should be int, got ' + r5Type)
  }

  // int ^ int → int
  let r6 = a ^ b
  let r6Type = typeof(r6)
  if (r6Type != 'int') {
    throw new Error('int^int should be int, got ' + r6Type)
  }

  // long ^ long → long
  let r7 = c ^ d
  let r7Type = typeof(r7)
  if (r7Type != 'long') {
    throw new Error('long^long should be long, got ' + r7Type)
  }

  // long & long → long
  let r8 = c & d
  let r8Type = typeof(r8)
  if (r8Type != 'long') {
    throw new Error('long&long should be long, got ' + r8Type)
  }

  // long | long → long
  let r9 = c | d
  let r9Type = typeof(r9)
  if (r9Type != 'long') {
    throw new Error('long|long should be long, got ' + r9Type)
  }
console.log('verified')
}
main()
