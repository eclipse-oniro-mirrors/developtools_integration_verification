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
 * @id STMT_08_08_012_PASS_for_init_expression_sequence
 * @expect compile-pass
 * @section 8.8
 * @design forInit 使用 expressionSequence（逗号表达式）初始化已存在的多个变量 — STATEMENTS.md: forInit 可以是 expressionSequence
 * @note 正向用例：for (i = 0, j = 10; i < j; i++) 逗号表达式初始化 i 和 j
 */
function testForInitExpressionSequence(): void {
    let i: int = 0
    let j: int = 10
    let sum: int = 0
    for (i = 0, j = 5; i < j; i++) {
        sum = sum + i
    }
    console.log(sum)
}
