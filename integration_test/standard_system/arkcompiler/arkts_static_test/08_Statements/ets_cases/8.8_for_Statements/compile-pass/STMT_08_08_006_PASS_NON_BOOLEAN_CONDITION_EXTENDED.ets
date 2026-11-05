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
 * @id STMT_08_08_006_PASS_NON_BOOLEAN_CONDITION_EXTENDED
 * @expect compile-pass
 * @section 8.8
 * @design forContinue 表达式类型为非 boolean（int 类型），当前版本因 Extended Conditional Expressions 允许编译通过（spec标注未来版本将废弃此特性）
 * @note 正向用例（Extended Conditional Expressions）：for (let i = 0; i; i++) 条件 i 为 int 而非 boolean
 */
function testNonBooleanCondition(): void {
    let sum: int = 0
    for (let i = 0; i; i++) {
        sum = sum + i
    }
}
