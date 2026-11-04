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
 * @id EXP_07_23_01_002_PASS_INT_LONG_TYPE_COMBOS
 * @expect compile-pass
 * @section 7.23.1
 * @design 验证 int/int/long 乘法类型组合：
 *         int*int→int，int*long→long，long*long→long
 * @note 正向用例：验证整数乘法结果类型取最大操作数类型
 */
function main(): void {
  let a: int = 5
  let b: int = 10
  let c: long = 100

  // int * int → int
  let r1 = a * b
  let r1Type = typeof(r1)
  if (r1Type != 'int') {
    throw new Error('int*int should be int, got ' + r1Type)
  }

  // int * long → long
  let r2 = a * c
  let r2Type = typeof(r2)
  if (r2Type != 'long') {
    throw new Error('int*long should be long, got ' + r2Type)
  }

  // long * int → long（操作数顺序不影响类型）
  let r3 = c * a
  let r3Type = typeof(r3)
  if (r3Type != 'long') {
    throw new Error('long*int should be long, got ' + r3Type)
  }

  // long * long → long
  let r4 = c * c
  let r4Type = typeof(r4)
  if (r4Type != 'long') {
    throw new Error('long*long should be long, got ' + r4Type)
  }
console.log('verified')
}
main()
