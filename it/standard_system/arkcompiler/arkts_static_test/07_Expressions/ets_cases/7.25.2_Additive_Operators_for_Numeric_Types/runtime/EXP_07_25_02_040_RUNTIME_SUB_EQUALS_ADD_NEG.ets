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
 * @id EXP_07_25_02_040_RUNTIME_SUB_EQUALS_ADD_NEG
 * @expect runtime
 * @section 7.25.2
 * @design 验证 a-b 等于 a+(-b) 对整数和浮点数都成立。
 *         spec：a-b 的结果始终与 a+(-b) 相同，无论是整数还是浮点数减法。
 * @note 运行时用例：减法等价于加负值
 */
function main(): void {
  // int: a-b = a+(-b)
  let a: int = 10
  let b: int = 3
  let sub1: int = a - b
  let addNeg1: int = a + (-b)
  if (sub1 != addNeg1) {
    throw new Error('int: 10-3(' + sub1 + ') != 10+(-3)(' + addNeg1 + ')')
  }

  // int: 负数
  let sub2: int = (-5) - (-3)
  let addNeg2: int = (-5) + 3
  if (sub2 != addNeg2) {
    throw new Error('int: (-5)-(-3)(' + sub2 + ') != (-5)+3(' + addNeg2 + ')')
  }

  // double: a-b = a+(-b)
  let x: double = 7.5
  let y: double = 2.3
  let sub3: double = x - y
  let addNeg3: double = x + (-y)
  // 浮点比较使用容差
  let diff: double = sub3 - addNeg3
  if (diff < -0.0000001 || diff > 0.0000001) {
    throw new Error('double: 7.5-2.3(' + sub3 + ') != 7.5+(-2.3)(' + addNeg3 + ')')
  }

  // float: a-b = a+(-b)
  let p: float = Double.toFloat(100.5)
  let q: float = Double.toFloat(50.25)
  let sub4: float = p - q
  let addNeg4: float = p + (-q)
  let diff2: float = sub4 - addNeg4
  if (diff2 < -0.0001 || diff2 > 0.0001) {
    throw new Error('float: 100.5-50.25(' + sub4 + ') != 100.5+(-50.25)(' + addNeg4 + ')')
  }
console.log('verified')
}
main()
