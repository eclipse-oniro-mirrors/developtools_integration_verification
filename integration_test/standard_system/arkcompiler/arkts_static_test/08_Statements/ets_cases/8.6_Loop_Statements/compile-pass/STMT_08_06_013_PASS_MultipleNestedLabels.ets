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
 * @id STMT_08_06_013_PASS_MultipleNestedLabels
 * @expect compile-pass
 * @section 8.6
 * @design 嵌套循环各自带标签：for/while/do-while 三层嵌套，每层各有标签，break 和 continue 正确引用对应标签
 * @note 验证 loopStatement 语法中 (identifier ':')? 前缀在多层嵌套中的正确使用，break/continue 可精确控制任意外层循环
 */
function testMultipleNestedLabels(): void {
  let sum: int = 0;
  outer: for (let i: int = 0; i < 5; i++) {
    middle: while (sum < 20) {
      inner: do {
        sum++;
        if (sum === 3) {
          break inner;
        }
        if (sum === 8) {
          continue middle;
        }
        if (sum === 12) {
          break outer;
        }
      } while (sum < 10);
      sum++;
      if (sum === 15) {
        continue outer;
      }
    }
  }
}

function testNestedLabelsBreakContinue(): void {
  let found: boolean = false;
  searchOuter: for (let row: int = 0; row < 3; row++) {
    searchInner: for (let col: int = 0; col < 3; col++) {
      if (row === 1 && col === 1) {
        found = true;
        break searchOuter;
      }
    }
    if (!found) {
      continue searchOuter;
    }
  }
}

function testLabelOnWhileInnerFor(): void {
  let count: int = 0;
  wl: while (count < 10) {
    for (let i: int = 0; i < 5; i++) {
      count++;
      if (i === 2) {
        break wl;
      }
    }
  }
}
