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
 * @id STMT_08_05_001_PASS_BASIC_IF
 * @expect compile-pass
 * @section 8.5
 * @design 基本 if 语句，条件表达式使用 boolean 字面量和 boolean 变量
 * @note 正向用例：if(true)、if(false)、if(boolean_var) 均应通过编译
 */
function testBasicIf(): void {
  let x: int = 0
  // boolean 字面量 true
  if (true) {
    x = 1
  }
  // boolean 字面量 false
  if (false) {
    x = 99
  }
  // boolean 变量
  let cond: boolean = true
  if (cond) {
    x = 2
  }
  // 逻辑非表达式
  if (!cond) {
    x = 3
  }
}
