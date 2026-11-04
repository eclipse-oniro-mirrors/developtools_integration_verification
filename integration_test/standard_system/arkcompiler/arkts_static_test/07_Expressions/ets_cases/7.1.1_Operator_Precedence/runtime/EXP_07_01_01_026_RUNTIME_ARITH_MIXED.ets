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
 * @id EXP_07_01_01_026_RUNTIME_ARITH_MIXED
 * @expect runtime
 * @section 7.1.1
 * @design 算术混合优先级：`1 + 2 * 3 - 4 / 2` = 1 + 6 - 2 = 5
 * @note 运行时用例：验证乘除优先于加减
 */
function main(): void {
  let r1: int = 1 + 2 * 3 - 4 / 2
  if (r1 != 5) {
    throw new Error('assertion failed: 1+2*3-4/2 != 5, got ' + r1)
  }
  let r2: int = 10 - 6 / 3 + 2 * 4
  if (r2 != 16) {
    throw new Error('assertion failed: 10-6/3+2*4 != 16, got ' + r2)
  }
  let r3: int = 2 * 3 + 4 % 3
  if (r3 != 7) {
    throw new Error('assertion failed: 2*3+4%3 != 7, got ' + r3)
  }
console.log('verified')
}
