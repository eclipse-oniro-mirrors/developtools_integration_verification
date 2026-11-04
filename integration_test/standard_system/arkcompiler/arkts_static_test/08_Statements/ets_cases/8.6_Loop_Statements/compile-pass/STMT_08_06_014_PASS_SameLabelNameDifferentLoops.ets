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
 * @id STMT_08_06_014_PASS_SameLabelNameDifferentLoops
 * @expect compile-pass
 * @section 8.6
 * @design 标签作用域隔离：两个顺序排列的非嵌套循环可使用相同标签名，各自独立作用域
 * @note 标签作用域限定在其关联的 loopStatement 内，不同循环中的同名标签互不干扰，break/continue 各自引用本循环的标签
 */
function testSameLabelInSequentialForLoops(): void {
  let sum: int = 0;
  loop1: for (let i: int = 0; i < 5; i++) {
    sum += i;
    if (i === 3) {
      break loop1;
    }
  }
  // Different scope — same label name is valid
  loop1: for (let j: int = 0; j < 5; j++) {
    sum += j;
    if (j === 2) {
      continue loop1;
    }
  }
}

function testSameLabelInSequentialWhileLoops(): void {
  let x: int = 0;
  myLabel: while (x < 10) {
    x++;
    if (x === 5) {
      break myLabel;
    }
  }
  // Reusing myLabel in a new, non-overlapping scope
  myLabel: while (x < 20) {
    x++;
    if (x === 15) {
      break myLabel;
    }
  }
}

function testSameLabelMixedLoopTypes(): void {
  let y: int = 0;
  lbl: for (let i: int = 0; i < 3; i++) {
    y += i;
    if (y > 2) {
      break lbl;
    }
  }
  // Same label name on a different loop type (do-while) — separate scope
  lbl: do {
    y++;
    if (y > 10) {
      break lbl;
    }
  } while (y < 15);
}
