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
 * @id STMT_08_08_009_PASS_for_empty_all_parts
 * @expect compile-pass
 * @section 8.8
 * @design for 循环的三个部分均可为空 — STATEMENTS.md: forInit/forContinue/forUpdate 均为可选
 * @note 正向用例：for(;;) 空所有部分（无限循环，靠 break 退出）
 */
function testForEmptyAllParts(): void {
  let i: int = 0
  for (;;) {
    i++
    if (i >= 10) { break }
  }
}
