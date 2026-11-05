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
 * @id STMT_08_08_017_RUNTIME_for_expression_sequence
 * @expect runtime
 * @section 8.8
 * @design 运行时验证 forInit 和 forUpdate 中使用 expressionSequence 的正确执行行为和求值顺序
 * @note 运行时用例：for (i = 0, j = 5; i < j; i++, j--) 验证逗号表达式初始化和多变量更新
 */
function main(): void {
    let i: int = 0
    let j: int = 10
    let sum: int = 0
    for (i = 0, j = 5; i < j; i++, j--) {
        sum = sum + i
    }
    if (sum != 3) {
        throw new Error("expressionSequence for sum failed, expected 3 but got " + sum)
    }
    console.log("verified")
}
