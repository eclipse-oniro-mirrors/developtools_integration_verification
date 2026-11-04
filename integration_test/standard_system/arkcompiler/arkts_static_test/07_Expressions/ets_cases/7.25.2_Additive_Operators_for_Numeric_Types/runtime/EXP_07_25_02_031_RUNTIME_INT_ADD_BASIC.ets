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
 * @id EXP_07_25_02_031_RUNTIME_INT_ADD_BASIC
 * @expect runtime
 * @section 7.25.2
 * @design 验证 int+int 基本加法值正确，含负数、边界值。
 *         spec：二元运算符'+'执行加法并产生操作数的和。
 * @note 运行时用例：int 加法值验证
 */
function main(): void {
  // 正数加法
  let r1: int = 5 + 3
  if (r1 != 8) {
    throw new Error('5+3 should be 8, got ' + r1)
  }

  // 负数加法
  let r2: int = (-5) + 3
  if (r2 != -2) {
    throw new Error('(-5)+3 should be -2, got ' + r2)
  }

  // 零加法
  let r3: int = 0 + 42
  if (r3 != 42) {
    throw new Error('0+42 should be 42, got ' + r3)
  }

  // 变量加法
  let a: int = 100
  let b: int = 200
  let r4: int = a + b
  if (r4 != 300) {
    throw new Error('100+200 should be 300, got ' + r4)
  }

  // 负数+负数
  let r5: int = (-7) + (-3)
  if (r5 != -10) {
    throw new Error('(-7)+(-3) should be -10, got ' + r5)
  }
console.log('verified')
}
main()
