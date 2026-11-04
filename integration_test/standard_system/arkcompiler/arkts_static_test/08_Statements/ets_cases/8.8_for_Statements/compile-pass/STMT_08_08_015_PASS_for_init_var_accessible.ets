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
 * @id STMT_08_08_015_PASS_for_init_var_accessible
 * @expect compile-pass
 * @section 8.8
 * @design forInit 声明的循环变量在 forContinue 表达式、forUpdate 表达式和循环体中均可访问 — STATEMENTS.md line 251-252
 * @note 正向用例：for (let i = 0; i < 10; i = i + 2) 循环变量 i 在条件和更新中可访问
 */
function testForInitVarAccessible(): void {
    let sum: int = 0
    for (let i: int = 0; i < 10; i = i + 2) {
        sum = sum + i
    }
    console.log(sum)
}
