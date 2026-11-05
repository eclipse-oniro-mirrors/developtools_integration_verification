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
 * @id EXP2_17_08_004_PASS_FOR_LOOP
 * @expect compile-pass
 * @section 17.8
 * @design 验证标准 for 循环在 ArkTS 中编译通过
 * @note 正向用例：验证 for(init; cond; update) 循环的标准用法编译通过
 */
function testForLoop(): void {
  // standard for loop
  let sum: number = 0
  for (let i: number = 0; i < 10; i++) {
    sum = sum + i
  }

  // for loop with multiple variables
  for (let m: number = 0, n: number = 10; m < n; m++, n--) {
    let diff: number = n - m
  }

  // for loop with break
  for (let k: number = 0; k < 100; k++) {
    if (k >= 5) {
      break
    }
  }

  // for loop with continue
  let oddSum: number = 0
  for (let p: number = 0; p < 10; p++) {
    if (p % 2 == 0) {
      continue
    }
    oddSum = oddSum + p
  }
}
