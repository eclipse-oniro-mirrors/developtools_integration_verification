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
 * @id STMT_08_13_019_PASS_char_case_on_int_switch
 * @expect compile-pass
 * @section 8.13
 * @design int 类型 switch 表达式中使用 char 字面量 case，编译通过
 * @note spec §8.13 case 匹配按 == 比较；char 与 int 在数值上下文可比，编译器允许（受 Extended 语义影响 char 可作 int case）
 */
function testCharCaseOnIntSwitch(): void {
    let x: int = 1;
    switch (x) {
        case c'a':
            break;
        default:
            break;
    }
}
