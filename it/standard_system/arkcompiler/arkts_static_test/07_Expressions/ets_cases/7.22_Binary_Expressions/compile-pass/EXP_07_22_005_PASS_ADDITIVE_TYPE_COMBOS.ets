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
 * @id EXP_07_22_005_PASS_ADDITIVE_TYPE_COMBOS
 * @expect compile-pass
 * @section 7.22
 * @design 验证加法/减法 +/- 的类型组合表规则：
 *          byte+byte→int, int+int→int,
 *          int+long→long, long+float→float,
 *          float+double→double
 * @note 正向用例：加法和减法遵循最大类型规则进行 Widening
 */
function main(): void {
  let a: byte = 3
  let b: byte = 2
  let c: int = 10
  let d: long = 100
  let e: float = 2.5 as float
  let f: double = 3.5
  let s: short = 5

  // byte + byte → int
  let r1 = a + b
  let r1Type = typeof(r1)
  if (r1Type != 'int') {
    throw new Error('byte+byte should be int, got ' + r1Type)
  }

  // short + int → int
  let r2 = s + c
  let r2Type = typeof(r2)
  if (r2Type != 'int') {
    throw new Error('short+int should be int, got ' + r2Type)
  }

  // int + long → long
  let r3 = c + d
  let r3Type = typeof(r3)
  if (r3Type != 'long') {
    throw new Error('int+long should be long, got ' + r3Type)
  }

  // byte + long → long
  let r4 = a + d
  let r4Type = typeof(r4)
  if (r4Type != 'long') {
    throw new Error('byte+long should be long, got ' + r4Type)
  }

  // int + float → float
  let r5 = c + e
  let r5Type = typeof(r5)
  if (r5Type != 'float') {
    throw new Error('int+float should be float, got ' + r5Type)
  }

  // float + double → double (typeof => "number")
  let r6 = e + f
  let r6Type = typeof(r6)
  if (r6Type != 'number') {
    throw new Error('float+double should be number, got ' + r6Type)
  }

  // 同样规则适用于减法
  // byte - byte → int
  let r7 = a - b
  let r7Type = typeof(r7)
  if (r7Type != 'int') {
    throw new Error('byte-byte should be int, got ' + r7Type)
  }

  // long - int → long
  let r8 = d - c
  let r8Type = typeof(r8)
  if (r8Type != 'long') {
    throw new Error('long-int should be long, got ' + r8Type)
  }
console.log('verified')
}
main()
