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
 * @id STMT_08_13_009_FAIL_duplicate_default
 * @expect compile-fail
 * @section 8.13
 * @design switch 语句中多个 default 子句应产生编译错误 — STATEMENTS.md 只允许一个 defaultClause
 * @note 反向用例：两个 default 子句 → Syntax error ESY0171 Multiple default clauses
 */
function testDuplicateDefault(): void {
  switch (1) {
    case 1:
      break;
    default:
      break;
    default:
      break;
  }
}
