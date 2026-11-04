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
 * @id EXP_07_23_01_006_PASS_MIXED_NUMERIC_PROMOTION
 * @expect compile-pass
 * @section 7.23.1
 * @design 验证更多混合数值类型乘法提升规则：
 *         byte→int→long→float→double 的完整提升链。
 *         结果类型始终取最大操作数类型。
 * @note 正向用例：覆盖更丰富的混合类型组合
 */
function main(): void {
  let a: byte = 2
  let b: short = 3
  let c: int = 4
  let d: long = 5
  let e: float = Double.toFloat(1.5)
  let f: double = 2.5

  // byte * int → int（byte 提升到 int）
  let r1 = a * c
  let r1Type = typeof(r1)
  if (r1Type != 'int') {
    throw new Error('byte*int should be int, got ' + r1Type)
  }

  // short * long → long（short 提升到 long）
  let r2 = b * d
  let r2Type = typeof(r2)
  if (r2Type != 'long') {
    throw new Error('short*long should be long, got ' + r2Type)
  }

  // byte * float → float（提升到 float）
  let r3 = a * e
  let r3Type = typeof(r3)
  if (r3Type != 'float') {
    throw new Error('byte*float should be float, got ' + r3Type)
  }

  // long * float → float（long 提升到 float）
  let r4 = d * e
  let r4Type = typeof(r4)
  if (r4Type != 'float') {
    throw new Error('long*float should be float, got ' + r4Type)
  }

  // int * double → number（提升到 double）
  let r5 = c * f
  let r5Type = typeof(r5)
  if (r5Type != 'number') {
    throw new Error('int*double should be number, got ' + r5Type)
  }

  // long * double → number
  let r6 = d * f
  let r6Type = typeof(r6)
  if (r6Type != 'number') {
    throw new Error('long*double should be number, got ' + r6Type)
  }
console.log('verified')
}
main()
