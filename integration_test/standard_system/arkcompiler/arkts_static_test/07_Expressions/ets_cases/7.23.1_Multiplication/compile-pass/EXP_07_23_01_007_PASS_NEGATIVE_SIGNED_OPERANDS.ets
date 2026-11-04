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
 * @id EXP_07_23_01_007_PASS_NEGATIVE_SIGNED_OPERANDS
 * @expect compile-pass
 * @section 7.23.1
 * @design 验证负数操作数乘法编译通过：int * (-int)、
 *         (-float) * (-float)、double * (-int) 等有符号运算
 * @note 正向用例：验证乘法支持有符号操作数
 */
function main(): void {
  let a: int = -5
  let b: int = 3
  let c: float = Double.toFloat(-2.5)
  let d: double = -3.5

  // 负数乘正数 → 负数
  let r1 = a * b
  if (r1 != -15) {
    throw new Error('-5 * 3 should be -15, got ' + r1)
  }

  // 负数乘负数 → 正数
  let r2 = a * (-b)
  if (r2 != 15) {
    throw new Error('-5 * -3 should be 15, got ' + r2)
  }

  // 负浮点
  let r3 = c * Double.toFloat(2.0)
  if (r3 != -5.0) {
    throw new Error('-2.5 * 2.0 should be -5.0, got ' + r3)
  }

  // 负 double
  let r4 = d * 2.0
  let r4Type = typeof(r4)
  if (r4Type != 'number') {
    throw new Error('double*double should be number, got ' + r4Type)
  }
console.log('verified')
}
main()
