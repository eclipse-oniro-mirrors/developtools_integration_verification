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
 * @id STMT_08_08_013_PASS_for_update_expression_sequence
 * @expect compile-pass
 * @section 8.8
 * @design forUpdate 使用 expressionSequence（逗号表达式）更新多个变量 — STATEMENTS.md: forUpdate 是 expressionSequence
 * @note 正向用例：for (let i = 0; i < 5; i++, j--) 逗号表达式同时更新 i 和 j
 */
function testForUpdateExpressionSequence(): void {
    let j: int = 5
    let sum: int = 0
    for (let i: int = 0; i < 5; i++, j--) {
        sum = sum + i + j
    }
    console.log(sum)
}
