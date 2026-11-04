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
 * @id STMT_08_07_007_PASS_do_while_condition_string_extended
 * @expect compile-pass
 * @section 8.7
 * @design do-while 条件使用字符串字面量(非 boolean)，期望编译报错
 * @note do-while 条件表达式必须为 boolean 类型，字符串字面量不符合要求
 */
function testDoWhileConditionString(): void {
    do {
        // loop body
    } while ("abc");
}
