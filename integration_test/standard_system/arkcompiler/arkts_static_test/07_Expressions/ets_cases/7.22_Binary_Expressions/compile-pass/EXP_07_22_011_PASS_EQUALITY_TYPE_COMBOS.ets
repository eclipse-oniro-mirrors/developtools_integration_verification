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
 * @id EXP_07_22_011_PASS_EQUALITY_TYPE_COMBOS
 * @expect compile-pass
 * @section 7.22
 * @design 验证相等运算符 == / === / != / !== 的类型组合：
 *          int==int→boolean, boolean!=boolean→boolean,
 *          bigint===bigint→boolean, string!==string→boolean
 * @note 正向用例：相等运算符在多种类型间返回 boolean
 */
function main(): void {
  let a: int = 42
  let b: int = 42
  let c: string = 'hello'
  let d: string = 'world'
  let e: boolean = true
  let f: boolean = false
  let g: bigint = 100n
  let h: bigint = 100n

  // int == int → boolean
  let r1 = a == b
  let r1Type = typeof(r1)
  if (r1Type != 'boolean') {
    throw new Error('int==int should be boolean, got ' + r1Type)
  }

  // int != int → boolean
  let r2 = a != (a + 1)
  let r2Type = typeof(r2)
  if (r2Type != 'boolean') {
    throw new Error('int!=int should be boolean, got ' + r2Type)
  }

  // boolean != boolean → boolean
  let r3 = e != f
  let r3Type = typeof(r3)
  if (r3Type != 'boolean') {
    throw new Error('boolean!=boolean should be boolean, got ' + r3Type)
  }

  // boolean == boolean → boolean
  let r4 = e == (f == false)
  let r4Type = typeof(r4)
  if (r4Type != 'boolean') {
    throw new Error('boolean==boolean should be boolean, got ' + r4Type)
  }

  // string == string → boolean
  let r5 = c == c
  let r5Type = typeof(r5)
  if (r5Type != 'boolean') {
    throw new Error('string==string should be boolean, got ' + r5Type)
  }

  // string !== string → boolean
  let r6 = c !== d
  let r6Type = typeof(r6)
  if (r6Type != 'boolean') {
    throw new Error('string!==string should be boolean, got ' + r6Type)
  }

  // bigint === bigint → boolean
  let r7 = g === h
  let r7Type = typeof(r7)
  if (r7Type != 'boolean') {
    throw new Error('bigint===bigint should be boolean, got ' + r7Type)
  }

  // bigint !== bigint → boolean
  let r8 = g !== (g + 1n)
  let r8Type = typeof(r8)
  if (r8Type != 'boolean') {
    throw new Error('bigint!==bigint should be boolean, got ' + r8Type)
  }
console.log('verified')
}
main()
