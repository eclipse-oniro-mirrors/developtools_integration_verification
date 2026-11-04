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
 * @id STMT_08_11_009_FAIL_continue_at_top_level
 * @expect compile-fail
 * @section 8.11
 * @design continue 语句在顶层（非循环内）应产生编译错误 — STATEMENTS.md: "If there is no enclosing loopStatement... then a compile-time error occurs"
 * @note 反向用例：顶层 continue → Syntax error ESY0165 Illegal continue statement + Semantic error ESE0161
 */
continue
