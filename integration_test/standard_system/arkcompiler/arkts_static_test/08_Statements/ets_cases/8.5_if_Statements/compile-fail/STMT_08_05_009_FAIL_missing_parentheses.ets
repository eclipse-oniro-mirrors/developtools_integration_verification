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
 * @id STMT_08_05_009_FAIL_missing_parentheses
 * @expect compile-fail
 * @section 8.5
 * @design if 语句缺少括号应产生语法错误 — STATEMENTS.md 要求 'if' '(' expression ')'
 * @note 反向用例：if 后直接跟 true 缺少括号 → Syntax error ESY0230 Expected '('
 */
function testMissingParens(): void {
  if true { let x: int = 1 }
}
