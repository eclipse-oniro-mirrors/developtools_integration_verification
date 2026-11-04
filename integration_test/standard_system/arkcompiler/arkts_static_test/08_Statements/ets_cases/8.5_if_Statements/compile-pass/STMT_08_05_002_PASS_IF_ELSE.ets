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
 * @id STMT_08_05_002_PASS_IF_ELSE
 * @expect compile-pass
 * @section 8.5
 * @design if-else 语句的两个分支均通过编译，boolean 条件驱动分支选择
 * @note 正向用例：if-else 基本形式，含 true/false 条件和 boolean 变量
 */
function testIfElse(): void {
  let x: int = 0
  // if-true 走 then 分支
  if (true) {
    x = 1
  } else {
    x = 2
  }
  // if-false 走 else 分支
  if (false) {
    x = 3
  } else {
    x = 4
  }
  // boolean 变量 true
  let cond: boolean = true
  if (cond) {
    x = 5
  } else {
    x = 6
  }
  // boolean 变量 false
  cond = false
  if (cond) {
    x = 7
  } else {
    x = 8
  }
}
