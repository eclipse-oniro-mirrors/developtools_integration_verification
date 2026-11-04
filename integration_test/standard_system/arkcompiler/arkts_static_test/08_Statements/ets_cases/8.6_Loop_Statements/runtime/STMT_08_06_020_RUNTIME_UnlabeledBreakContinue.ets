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
 * @id STMT_08_06_020_RUNTIME_UnlabeledBreakContinue
 * @expect runtime
 * @section 8.6
 * @design 无标签 break/continue 在嵌套循环中的运行时行为：仅控制最内层循环，不影响外层
 * @note 验证无标签 break 仅退出最内层循环，无标签 continue 仅跳过最内层当前迭代，外层循环不受影响
 */
function main(): void {
  // Test 1: unlabeled break in nested for loops — only exits inner loop
  let sum1: int = 0;
  for (let i: int = 0; i < 3; i++) {
    for (let j: int = 0; j < 5; j++) {
      if (j === 2) {
        break;
      }
      sum1++;
    }
  }
  // i=0: j=0 => sum1=1, j=1 => sum1=2, j=2 => break (inner loop exits)
  // i=1: j=0 => sum1=3, j=1 => sum1=4, j=2 => break
  // i=2: j=0 => sum1=5, j=1 => sum1=6, j=2 => break
  // total = 6
  if (sum1 !== 6) {
    throw new Error("Test 1 failed: expected 6 but got " + sum1);
  }

  // Test 2: unlabeled continue in nested for loops — only skips inner iteration
  let sum2: int = 0;
  for (let i: int = 0; i < 3; i++) {
    for (let j: int = 0; j < 4; j++) {
      if (j === 1) {
        continue;
      }
      sum2++;
    }
  }
  // i=0: j=0 => sum2=1, j=1 => continue, j=2 => sum2=2, j=3 => sum2=3
  // i=1: j=0 => sum2=4, j=1 => continue, j=2 => sum2=5, j=3 => sum2=6
  // i=2: j=0 => sum2=7, j=1 => continue, j=2 => sum2=8, j=3 => sum2=9
  // total = 9
  if (sum2 !== 9) {
    throw new Error("Test 2 failed: expected 9 but got " + sum2);
  }

  // Test 3: unlabeled break in while loop nested inside for loop
  let sum3: int = 0;
  for (let i: int = 0; i < 4; i++) {
    let j: int = 0;
    while (j < 5) {
      sum3++;
      j++;
      if (j === 2) {
        break;
      }
    }
  }
  // i=0: j=0=>sum3=1,j=1, j=1=>sum3=2,j=2=>break
  // i=1: j=0=>sum3=3,j=1, j=1=>sum3=4,j=2=>break
  // i=2: j=0=>sum3=5, j=1=>sum3=6,j=2=>break
  // i=3: j=0=>sum3=7, j=1=>sum3=8,j=2=>break
  // total = 8
  if (sum3 !== 8) {
    throw new Error("Test 3 failed: expected 8 but got " + sum3);
  }

  // Test 4: unlabeled continue in do-while nested inside while
  let sum4: int = 0;
  let outerCount: int = 0;
  while (outerCount < 3) {
    let k: int = 0;
    do {
      k++;
      if (k === 3) {
        continue;
      }
      sum4++;
    } while (k < 4);
    outerCount++;
  }
  // Each outer iteration: k=1=>sum4++, k=2=>sum4++, k=3=>continue (skip sum4++), k=4=>sum4++ => 3 per outer iter
  // 3 outer iterations => 3*3 = 9
  if (sum4 !== 9) {
    throw new Error("Test 4 failed: expected 9 but got " + sum4);
  }

  // Test 5: unlabeled break in for-of nested inside for
  let sum5: int = 0;
  let arr: int[] = [1, 2, 3, 4, 5];
  for (let i: int = 0; i < 2; i++) {
    for (let v of arr) {
      if (v === 3) {
        break;
      }
      sum5 += v;
    }
  }
  // i=0: v=1=>sum5=1, v=2=>sum5=3, v=3=>break
  // i=1: v=1=>sum5=4, v=2=>sum5=6, v=3=>break
  // total = 6
  if (sum5 !== 6) {
    throw new Error("Test 5 failed: expected 6 but got " + sum5);
  }

  console.log("verified");
}
