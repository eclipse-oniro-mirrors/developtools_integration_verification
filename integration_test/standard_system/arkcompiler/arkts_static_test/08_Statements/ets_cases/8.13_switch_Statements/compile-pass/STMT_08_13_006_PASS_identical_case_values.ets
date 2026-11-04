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
 * @id STMT_08_13_006_PASS_identical_case_values
 * @expect compile-pass
 * @section 8.13
 * @design switch 中允许多个相同的 case 表达式 — STATEMENTS.md line 459 "One may have several case clauses with the same expression in"
 * @note 正向用例：两个 case 1 连续出现，case null 重复出现，验证编译器允许相同 case 表达式的 caseClause
 */
function testIdenticalCaseValues(): void {
    let x: int = 1;
    let result: string = "";
    switch (x) {
        case 1:
        case 1:
            result = "one";
            break;
        case 2:
            result = "two";
            break;
        default:
            result = "other";
            break;
    }
}
