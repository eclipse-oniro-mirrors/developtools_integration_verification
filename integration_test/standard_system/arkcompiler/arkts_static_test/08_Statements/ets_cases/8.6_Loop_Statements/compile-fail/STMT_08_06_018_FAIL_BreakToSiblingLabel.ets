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
 * @id STMT_08_06_018_FAIL_BreakToSiblingLabel
 * @expect compile-fail
 * @section 8.6
 * @design break/continue 引用非包围作用域（兄弟循环）的标签 — 编译时错误
 * @note 标签作用域仅限其关联的 loopStatement 体及其嵌套子循环内，兄弟循环中的 break/continue 无法引用对方标签
 */
function testBreakToSiblingLabel(): void {
  labelA: for (let i: int = 0; i < 5; i++) {
    break labelA;
  }
  // labelA is out of scope here — this is a sibling loop, not nested
  for (let j: int = 0; j < 5; j++) {
    break labelA;
  }
}

function testContinueToSiblingLabel(): void {
  labelB: while (true) {
    break labelB;
  }
  do {
    continue labelB;
  } while (false);
}

function testBreakToLaterLabel(): void {
  // labelC is declared on a later loop — not in scope for this loop
  for (let i: int = 0; i < 3; i++) {
    break labelC;
  }
  labelC: for (let j: int = 0; j < 3; j++) {
    break labelC;
  }
}
