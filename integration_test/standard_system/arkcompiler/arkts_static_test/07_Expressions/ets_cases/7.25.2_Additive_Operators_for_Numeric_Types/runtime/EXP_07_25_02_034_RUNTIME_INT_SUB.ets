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
 * @id EXP_07_25_02_034_RUNTIME_INT_SUB
 * @expect runtime
 * @section 7.25.2
 * @design 验证 int-int 基本减法值正确。
 *         spec：二元运算符'-'执行减法，返回操作数的差（minuend - subtrahend）。
 *         结果与 a+(-b) 相同。
 * @note 运行时用例：int 减法值验证
 */
function main(): void {
  // 正数减法
  let r1: int = 10 - 3
  if (r1 != 7) {
    throw new Error('10-3 should be 7, got ' + r1)
  }

  // 负数减法
  let r2: int = 5 - (-3)
  if (r2 != 8) {
    throw new Error('5-(-3) should be 8, got ' + r2)
  }

  // 结果为负数
  let r3: int = 3 - 10
  if (r3 != -7) {
    throw new Error('3-10 should be -7, got ' + r3)
  }

  // 零减法
  let r4: int = 0 - 42
  if (r4 != -42) {
    throw new Error('0-42 should be -42, got ' + r4)
  }

  // 变量减法
  let a: int = 100
  let b: int = 200
  let r5: int = a - b
  if (r5 != -100) {
    throw new Error('100-200 should be -100, got ' + r5)
  }

  // 负数减负数
  let r6: int = (-5) - (-8)
  if (r6 != 3) {
    throw new Error('(-5)-(-8) should be 3, got ' + r6)
  }
console.log('verified')
}
main()
