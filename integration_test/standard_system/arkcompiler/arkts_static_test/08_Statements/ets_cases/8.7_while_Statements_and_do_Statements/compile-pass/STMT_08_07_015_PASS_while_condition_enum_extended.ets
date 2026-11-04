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
 * @id STMT_08_07_015_PASS_while_condition_enum_extended
 * @expect compile-pass
 * @section 8.7
 * @design while 条件使用 enum 类型（Extended Conditional Expression），验证枚举值作为条件通过编译 — STATEMENTS.md §8.7
 * @note enum 属于 Extended Conditional Expressions 类型，可隐式转换为 truthy/falsy 判断
 */
enum Color {
    Red,
    Green,
    Blue
}

function testWhileConditionEnum(): void {
    let c: Color = Color.Green;
    while (c) {
        c = Color.Red;
        if (c == Color.Red) {
            break;
        }
    }
    let defaultColor: Color = Color.Red;
    while (defaultColor) {
        // Color.Red (value 0) is falsy, body should not execute
        break;
    }
}
