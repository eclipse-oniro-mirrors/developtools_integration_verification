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
 * @id STMT_08_13_003_PASS_string_switch
 * @expect compile-pass
 * @section 8.13
 * @design string类型switch表达式，case分支使用字符串字面量，验证任意类型的switch表达式支持
 * @note switch表达式可任意类型，此处用string，case匹配字符串字面量，每分支以break结束
 */
function testStringSwitch(): void {
    let s: string = "hello";
    let result: string = "";
    switch (s) {
        case "hello":
            result = "greeting";
            break;
        case "bye":
            result = "farewell";
            break;
        default:
            result = "unknown";
            break;
    }
}
