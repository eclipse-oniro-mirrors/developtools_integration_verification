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
 * @id STMT_08_01_012_PASS_multiple_abrupt_sources
 * @expect compile-pass
 * @section 8.1
 * @design 验证同一函数体内存在多种异常完成源（return、throw、break、continue）共存时编译通过
 * @note 不同 abrupt completion 源在各自的合法上下文中可以共存于同一函数体
 */

function testMultipleAbruptReturnThrow(flag: boolean): int {
  let x: int = 0;
  if (flag) {
    return 1;
    // return causes abrupt completion of function
  } else {
    throw new Error("no result");
    // throw causes abrupt completion
  }
  return x;
}

function testMultipleAbruptBreakContinueReturn(): int {
  let result: int = 0;
  for (let i: int = 0; i < 10; i++) {
    if (i == 1) {
      continue;
      // continue causes abrupt completion of current iteration
    }
    if (i == 3) {
      break;
      // break causes abrupt completion of loop
    }
    if (i == 5) {
      return result;
      // return causes abrupt completion of function
    }
    if (i == 7) {
      throw new Error("should not reach");
      // throw causes abrupt completion
    }
    result = result + i;
  }
  return result;
}

function testMultipleThrowsInBlock(val: int): void {
  if (val < 0) {
    throw new Error("negative");
  }
  if (val == 0) {
    throw new Error("zero");
  }
  if (val > 100) {
    throw new Error("too large");
  }
  // normal completion when none of the above match
  let x: int = val;
  x = x + 1;
}

function testBreakContinueInNestedLoops(): void {
  let count: int = 0;
  for (let i: int = 0; i < 5; i++) {
    for (let j: int = 0; j < 5; j++) {
      if (j == 0) {
        continue;
        // continue inner loop
      }
      if (j == 3) {
        break;
        // break inner loop
      }
      count = count + 1;
    }
  }
}
