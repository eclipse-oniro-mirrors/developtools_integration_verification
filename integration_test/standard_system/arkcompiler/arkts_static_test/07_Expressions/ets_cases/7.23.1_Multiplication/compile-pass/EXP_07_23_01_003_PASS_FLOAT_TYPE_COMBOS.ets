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
 * @id EXP_07_23_01_003_PASS_FLOAT_TYPE_COMBOS
 * @expect compile-pass
 * @section 7.23.1
 * @design 验证 float 乘法类型组合：
 *         float*int→float，float*float→float
 * @note 正向用例：验证 float 乘法按最大类型规则提升
 */
function main(): void {
  let a: float = Double.toFloat(2.5)
  let b: int = 10
  let c: float = Double.toFloat(3.0)

  // float * int → float
  let r1 = a * b
  let r1Type = typeof(r1)
  if (r1Type != 'float') {
    throw new Error('float*int should be float, got ' + r1Type)
  }

  // int * float → float（操作数顺序不影响）
  let r2 = b * a
  let r2Type = typeof(r2)
  if (r2Type != 'float') {
    throw new Error('int*float should be float, got ' + r2Type)
  }

  // float * float → float
  let r3 = a * c
  let r3Type = typeof(r3)
  if (r3Type != 'float') {
    throw new Error('float*float should be float, got ' + r3Type)
  }
console.log('verified')
}
main()
