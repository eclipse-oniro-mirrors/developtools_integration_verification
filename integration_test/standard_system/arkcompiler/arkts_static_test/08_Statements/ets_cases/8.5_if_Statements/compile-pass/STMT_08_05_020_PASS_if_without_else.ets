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
 * @id STMT_08_05_020_PASS_if_without_else
 * @expect compile-pass
 * @section 8.5
 * @design if 语句不带 else 分支 — STATEMENTS.md 允许单独的 if-then
 * @note 正向用例：if 不带 else 分支，条件为 false 时跳过 thenStatement
 */
function testIfWithoutElse(): void {
  let x: int = 0
  if (true) { x = 1 }
  if (false) { x = 99 }
}
