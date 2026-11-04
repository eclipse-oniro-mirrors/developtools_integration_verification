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
 * @id STMT_08_06_015_PASS_LabeledDoWhileAndForOf
 * @expect compile-pass
 * @section 8.6
 * @design spec §8.6 允许 labeled do-while / for-of（(identifier ':')? 前缀适用于 while|do|for|forOf 全部循环），本用例验证该正向语义
 * @note 正向用例（spec §8.6 四种循环均可带 label，应编译通过）。⚠️ 编译器 bug C-8.06-02：es2panda 编译时 SIGABRT 崩溃（rc=-6, core dump），故本 compile-pass 用例当前表现为 unexpected-fail；待 es2panda 修复 labeled statement 处理后转预期通过。差异见 issue_report C-8.06-02
 */
function testLabeledDoWhileBreak(): void {
  let i: int = 0;
  dwLabel: do {
    i++;
    if (i === 5) {
      break dwLabel;
    }
  } while (i < 10);
}

function testLabeledDoWhileContinue(): void {
  let sum: int = 0;
  let j: int = 0;
  dwl: do {
    j++;
    if (j % 2 === 0) {
      continue dwl;
    }
    sum += j;
  } while (j < 10);
}

function testLabeledForOfBreak(): void {
  let arr: int[] = [1, 2, 3, 4, 5, 6, 7];
  let found: int = -1;
  search: for (let v of arr) {
    if (v === 4) {
      found = v;
      break search;
    }
  }
}

function testLabeledForOfContinue(): void {
  let arr: int[] = [1, 2, 3, 4, 5];
  let oddSum: int = 0;
  filter: for (let v of arr) {
    if (v % 2 === 0) {
      continue filter;
    }
    oddSum += v;
  }
}

function testNestedLabeledForOf(): void {
  let matrix: int[][] = [[1, 2], [3, 4], [5, 6]];
  let target: int = 3;
  let foundRow: int = -1;
  rowScan: for (let row of matrix) {
    colScan: for (let val of row) {
      if (val === target) {
        break rowScan;
      }
    }
  }
}
