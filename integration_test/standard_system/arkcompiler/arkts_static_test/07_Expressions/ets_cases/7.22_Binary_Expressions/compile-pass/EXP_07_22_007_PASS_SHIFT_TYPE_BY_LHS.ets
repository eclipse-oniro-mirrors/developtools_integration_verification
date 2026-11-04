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
 * @id EXP_07_22_007_PASS_SHIFT_TYPE_BY_LHS
 * @expect compile-pass
 * @section 7.22
 * @design 验证移位运算符 << / >> / >>> 类型组合规则：
 *          int<<int→int（LHS int→int），
 *          long>>int→long（LHS long→long），
 *          float<<int→int, double>>int→long,
 *          bigint<<bigint→bigint
 *         Note 2：结果类型取决于 LHS 操作数
 * @note 正向用例：移位结果类型由左操作数决定
 */
function main(): void {
  let a: int = 8
  let b: int = 2
  let c: long = 100
  let d: float = 16.5 as float
  let e: double = 64.0

  // int << int → int (LHS int → int)
  let r1 = a << b
  let r1Type = typeof(r1)
  if (r1Type != 'int') {
    throw new Error('int<<int should be int, got ' + r1Type)
  }

  // int >> int → int
  let r2 = a >> b
  let r2Type = typeof(r2)
  if (r2Type != 'int') {
    throw new Error('int>>int should be int, got ' + r2Type)
  }

  // int >>> int → int
  let r3 = a >>> b
  let r3Type = typeof(r3)
  if (r3Type != 'int') {
    throw new Error('int>>>int should be int, got ' + r3Type)
  }

  // long >> int → long (LHS long → long)
  let r4 = c >> b
  let r4Type = typeof(r4)
  if (r4Type != 'long') {
    throw new Error('long>>int should be long, got ' + r4Type)
  }

  // long << int → long
  let r5 = c << b
  let r5Type = typeof(r5)
  if (r5Type != 'long') {
    throw new Error('long<<int should be long, got ' + r5Type)
  }

  // long >>> int → long
  let r6 = c >>> b
  let r6Type = typeof(r6)
  if (r6Type != 'long') {
    throw new Error('long>>>int should be long, got ' + r6Type)
  }

  // float << int → int (float → int per table Note 2)
  // 注意：float 作为 LHS 时 → int 结果
  let r7 = d << b
  let r7Type = typeof(r7)
  if (r7Type != 'int') {
    throw new Error('float<<int should be int, got ' + r7Type)
  }

  // double >> int → long (double as LHS → long)
  let r8 = e >> b
  let r8Type = typeof(r8)
  if (r8Type != 'long') {
    throw new Error('double>>int should be long, got ' + r8Type)
  }
console.log('verified')
}
main()
