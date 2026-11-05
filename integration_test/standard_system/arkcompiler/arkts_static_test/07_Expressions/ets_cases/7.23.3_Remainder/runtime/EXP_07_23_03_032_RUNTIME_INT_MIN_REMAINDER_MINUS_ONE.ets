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
 * @id EXP_07_23_03_032_RUNTIME_INT_MIN_REMAINDER_MINUS_ONE
 * @expect runtime
 * @section 7.23.3
 * @design 验证 INT_MIN % -1 = 0 特殊情况。
 *         spec：INT_MIN / -1 溢出，但取余结果为 0。
 *         恒等式 (INT_MIN/(-1))*(-1) + (INT_MIN%(-1)) = INT_MIN 成立。
 * @note 运行时用例：INT_MIN % -1 = 0
 */
function main(): void {
  // int 最小值 -2147483648 % -1 = 0
  let minInt: int = -2147483647 - 1
  let r1: int = minInt % (-1)
  if (r1 != 0) {
    throw new Error('INT_MIN%(-1) should be 0, got ' + r1)
  }

  // long 最小值 % -1 = 0
  let minLong: long = -9223372036854775807 - 1
  let r2: long = minLong % (-1)
  if (r2 != 0) {
    throw new Error('LONG_MIN%(-1) should be 0, got ' + r2)
  }

  // 验证恒等式成立
  let divResult: int = minInt / (-1)
  let identity: int = divResult * (-1) + r1
  if (identity != minInt) {
    throw new Error('Identity (a/b)*b + (a%b) == a failed for INT_MIN%-1')
  }
console.log('verified')
}
main()
