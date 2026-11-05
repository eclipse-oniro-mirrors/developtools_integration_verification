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
 * @id STMT_08_08_016_PASS_for_empty_update
 * @expect compile-pass
 * @section 8.8
 * @design forUpdate 为空，循环变量在循环体内手动更新 — STATEMENTS.md: forUpdate? 是可选的
 * @note 正向用例：for (let i = 0; i < 5; ) { i++ } 空的 forUpdate，循环体内手动递增
 */
function testForEmptyUpdate(): void {
    let sum: int = 0
    for (let i: int = 0; i < 5; ) {
        sum = sum + i
        i++
    }
    console.log(sum)
}
