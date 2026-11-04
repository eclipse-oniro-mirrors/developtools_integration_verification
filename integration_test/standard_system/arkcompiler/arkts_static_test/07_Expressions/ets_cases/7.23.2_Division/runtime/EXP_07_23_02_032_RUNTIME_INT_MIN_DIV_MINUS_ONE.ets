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
 * @id EXP_07_23_02_032_RUNTIME_INT_MIN_DIV_MINUS_ONE
 * @expect runtime
 * @section 7.23.2
 * @design 验证 INT_MIN / -1 溢出特殊情况。
 *         spec：The result equals the dividend if the dividend is a negative
 *         integer of the largest possible magnitude for its type, while the
 *         divisor is -1. No error is thrown in this case despite the overflow.
 *         int 最小值：-2147483648，(-2147483648)/(-1) = -2147483648
 * @note 运行时用例：INT_MIN / -1 溢出，返回被除数
 */
function main(): void {
  // int 最小值 -2147483648 / -1 = -2147483648（溢出，返回被除数）
  let minInt: int = -2147483647 - 1
  let r1: int = minInt / (-1)
  if (r1 != -2147483648) {
    throw new Error('INT_MIN/(-1) should be INT_MIN, got ' + r1)
  }

  // long 最小值 / -1
  let minLong: long = -9223372036854775807 - 1
  let r2: long = minLong / (-1)
  if (r2 != -9223372036854775807 - 1) {
    throw new Error('LONG_MIN/(-1) should be LONG_MIN, got ' + r2)
  }
console.log('verified')
}
main()
