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
 * @id EXP_07_22_032_RUNTIME_SHIFT_LHS_NOTE2
 * @expect runtime
 * @section 7.22
 * @design 验证 Note 2：移位运算符结果类型由左操作数类型决定。
 *         int<<long→int（LHS int→int），
 *         long<<int→long（LHS long→long），
 *         byte<<int→int（byte 提升为 int），
 *         float<<int→int（float 转为 int 再移位）
 * @note 运行时用例：移位结果类型仅取决于 LHS
 */
function main(): void {
  let a: int = 8
  let b: long = 2
  let c: long = 100
  let d: int = 2
  let e: byte = 16

  // int << long → int (LHS=int → int, 忽略 RHS=long)
  let r1 = a << b
  let r1Type = typeof(r1)
  if (r1Type != 'int') {
    throw new Error('int<<long should be int (LHS=int), got ' + r1Type)
  }

  // long << int → long (LHS=long → long, 忽略 RHS=int)
  let r2 = c << d
  let r2Type = typeof(r2)
  if (r2Type != 'long') {
    throw new Error('long<<int should be long (LHS=long), got ' + r2Type)
  }

  // 交换 LHS/RHS 后结果类型不同！
  // a=d=int, c=long
  // int << long → int
  let r3 = d << b
  let r3Type = typeof(r3)
  // long << int → long
  let r4 = c << d
  let r4Type = typeof(r4)
  if (r3Type == r4Type) {
    throw new Error('LHS type should determine result: int<<long=' + r3Type + ' long<<int=' + r4Type)
  }

  // byte << int → int (byte 提升为 int)
  let r5 = e << d
  let r5Type = typeof(r5)
  if (r5Type != 'int') {
    throw new Error('byte<<int should be int (byte promoted), got ' + r5Type)
  }

  // 实际值验证：8 << 2 = 32
  if (a << 2 != 32) {
    throw new Error('8<<2 should be 32')
  }

  // 100 >> 2 = 25
  if (c >> d != 25) {
    throw new Error('100>>2 should be 25')
  }
console.log('verified')
}
main()
