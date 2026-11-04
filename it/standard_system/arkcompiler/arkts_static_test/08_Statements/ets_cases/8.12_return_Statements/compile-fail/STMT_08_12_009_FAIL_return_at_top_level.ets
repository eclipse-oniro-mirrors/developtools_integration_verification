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
 * @id STMT_08_12_009_FAIL_return_at_top_level
 * @expect compile-fail
 * @section 8.12
 * @design return 语句在顶层（非函数/方法体内）应产生编译错误 — STATEMENTS.md: "top-level statements cannot contain a return statement"
 * @note 反向用例：顶层 return → Syntax error ESY0163 return keyword should be used in function body
 */
return
