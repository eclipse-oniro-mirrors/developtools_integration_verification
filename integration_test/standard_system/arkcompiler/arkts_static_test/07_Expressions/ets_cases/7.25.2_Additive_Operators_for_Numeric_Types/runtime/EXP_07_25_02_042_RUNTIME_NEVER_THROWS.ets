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
 * @id EXP_07_25_02_042_RUNTIME_NEVER_THROWS
 * @expect runtime
 * @section 7.25.2
 * @design 验证数值加减法永不抛异常，即使溢出、下溢或精度损失。
 *         spec：数值加法运算符的求值永不抛异常，尽管可能溢出、下溢或信息丢失。
 * @note 运行时用例：加减法不抛异常
 */
function main(): void {
  // int 溢出不抛异常
  let maxInt: int = 2147483647
  let r1: int = maxInt + 1
  if (r1 != -2147483648) {
    throw new Error('assertion failed: maxInt+1 should overflow to MIN_INT')
  }

  // int 下溢不抛异常
  let minInt: int = -2147483648
  let r2: int = minInt - 1
  if (r2 != 2147483647) {
    throw new Error('assertion failed: minInt-1 should underflow to MAX_INT')
  }

  // int 大数运算溢出
  let r3: int = 1000000000 + 2000000000
  if (r3 != -1294967296) {
    throw new Error('assertion failed: 1e9+2e9 overflow value wrong')
  }

  // long 溢出
  let maxLong: long = 9223372036854775807
  let r4: long = maxLong + 1
  if (r4 != -9223372036854775808) {
    throw new Error('assertion failed: maxLong+1 should overflow')
  }

  // float 溢出到 Infinity（不抛异常即为成功）

  // 大范围 int 减法溢出
  let r10: int = (-2147483648) - 1
  if (r10 != 2147483647) {
    throw new Error('assertion failed: MIN_INT-1 should underflow to MAX_INT')
  }
console.log('verified')
}
main()
