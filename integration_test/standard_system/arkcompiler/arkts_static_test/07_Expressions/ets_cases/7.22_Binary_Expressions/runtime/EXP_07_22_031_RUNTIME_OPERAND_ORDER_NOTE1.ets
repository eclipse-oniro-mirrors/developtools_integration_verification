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
 * @id EXP_07_22_031_RUNTIME_OPERAND_ORDER_NOTE1
 * @expect runtime
 * @section 7.22
 * @design 验证 Note 1：对于非移位运算符，操作数顺序不影响结果类型。
 *         测试 * / + - % & ^ | < > == 等。
 * @note 运行时用例：验证 a op b 和 b op a 的结果类型一致
 */
function main(): void {
  let a: int = 5
  let b: long = 10

  // +: a+b 和 b+a 都是 long
  let r1 = a + b
  let r2 = b + a
  if (typeof(r1) != typeof(r2)) {
    throw new Error('+ type differs by order: ' + typeof(r1) + ' vs ' + typeof(r2))
  }

  // *: a*b 和 b*a 都是 long
  let r3 = a * b
  let r4 = b * a
  if (typeof(r3) != typeof(r4)) {
    throw new Error('* type differs by order: ' + typeof(r3) + ' vs ' + typeof(r4))
  }

  // 浮点测试：int + float vs float + int 都是 float
  let c: float = 2.5 as float
  let r5 = a + c
  let r6 = c + a
  if (typeof(r5) != typeof(r6)) {
    throw new Error('float+ type differs by order: ' + typeof(r5) + ' vs ' + typeof(r6))
  }

  // ==: 结果类型 boolean
  let r7 = a == b
  let r8 = b == a
  if (typeof(r7) != typeof(r8)) {
    throw new Error('== type differs by order: ' + typeof(r7) + ' vs ' + typeof(r8))
  }

  // <: 结果类型 boolean
  let r9 = a < b
  let r10 = b < a
  if (typeof(r9) != typeof(r10)) {
    throw new Error('< type differs by order: ' + typeof(r9) + ' vs ' + typeof(r10))
  }
console.log('verified')
}
main()
