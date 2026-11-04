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
 * @id STMT_08_13_017_PASS_char_switch
 * @expect compile-pass
 * @section 8.13
 * @design char类型switch表达式，case分支使用char字面量，验证char类型switch支持
 * @note switch表达式可为任意类型，此处用char，case匹配char字面量(c'a'形式)，每分支以break结束
 */
function testCharSwitch(): void {
    let ch: char = c'a';
    let result: string = "";
    switch (ch) {
        case c'a':
            result = "lower_a";
            break;
        case c'b':
            result = "lower_b";
            break;
        case c'A':
            result = "upper_a";
            break;
        case c'\n':
            result = "newline";
            break;
        default:
            result = "other";
            break;
    }
}
