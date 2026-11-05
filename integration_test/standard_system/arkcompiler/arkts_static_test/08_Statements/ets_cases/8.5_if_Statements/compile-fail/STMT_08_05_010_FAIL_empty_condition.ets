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
 * @id STMT_08_05_010_FAIL_empty_condition
 * @expect compile-fail
 * @section 8.5
 * @design if 条件表达式不能为空 — STATEMENTS.md 要求 '(' expression ')'
 * @note 反向用例：if 括号内为空 → Syntax error ESY0227 Unexpected token ')'
 */
function testEmptyCondition(): void {
  if () { let x: int = 1 }
}
