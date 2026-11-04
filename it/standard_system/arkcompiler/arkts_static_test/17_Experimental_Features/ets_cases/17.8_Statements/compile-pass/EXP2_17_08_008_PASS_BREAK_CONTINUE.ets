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
 * @id EXP2_17_08_008_PASS_BREAK_CONTINUE
 * @expect compile-pass
 * @section 17.8
 * @design 验证 break 和 continue 在循环中正常编译通过
 * @note 正向用例：验证 break 跳出循环、continue 跳过迭代编译通过
 */
function testBreakInLoops(): void {
  // break in while
  let a: number = 0
  while (a < 10) {
    a = a + 1
    if (a == 5) {
      break
    }
  }

  // break in for
  for (let i: number = 0; i < 10; i++) {
    if (i == 7) {
      break
    }
  }

  // break in do-while
  let b: number = 0
  do {
    b = b + 1
    if (b == 3) {
      break
    }
  } while (b < 10)
}

function testContinueInLoops(): void {
  // continue in while
  let sum1: number = 0
  let c: number = 0
  while (c < 10) {
    c = c + 1
    if (c % 2 == 0) {
      continue
    }
    sum1 = sum1 + c
  }

  // continue in for
  let sum2: number = 0
  for (let j: number = 0; j < 10; j++) {
    if (j % 2 == 0) {
      continue
    }
    sum2 = sum2 + j
  }
}
