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
 * @id STMT_08_07_006_PASS_while_condition_number_extended
 * @expect compile-pass
 * @section 8.7
 * @design while 条件使用数字字面量(非 boolean)，期望编译报错
 * @note while 条件表达式必须为 boolean 类型，数字字面量 '1' 不符合要求
 */
function testWhileConditionNumber(): void {
    while (1) {
        // number literal as condition - compile error expected
    }
}
