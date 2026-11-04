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
 * @id STMT_08_13_022_PASS_switch_case_block_declaration
 * @expect compile-pass
 * @section 8.13
 * @design switch case 块内 let 声明 — 各 case 块创建独立块作用域
 * @note 正向用例：不同 case 块可声明同名变量
 */
function testSwitchCaseBlock(): void {
  let result: int = 0
  switch (1) {
    case 1: { let x: int = 10; result = x; break }
    case 2: { let x: int = 20; result = x; break }
    default: { let x: int = 30; result = x; break }
  }
}
