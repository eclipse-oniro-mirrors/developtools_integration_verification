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
 * @id STMT_08_07_010_FAIL_do_while_missing_while
 * @expect compile-fail
 * @section 8.7
 * @design do 语句不能缺少 while 关键字 — STATEMENTS.md 要求 'do' statement 'while' '(' expression ')'
 * @note 反向用例：do 块后没有 while → 语法错误
 */
function testDoMissingWhile(): void {
  do {
    let x: int = 1
  }
}
