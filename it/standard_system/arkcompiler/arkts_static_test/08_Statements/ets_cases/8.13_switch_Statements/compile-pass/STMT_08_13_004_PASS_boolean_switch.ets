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
 * @id STMT_08_13_004_PASS_boolean_switch
 * @expect compile-pass
 * @section 8.13
 * @design boolean类型switch表达式，case分支使用true/false字面量，验证布尔类型switch支持
 * @note switch表达式为boolean类型，case分支使用true和false字面量，验证任意类型switch
 */
function testBooleanSwitch(): void {
    let flag: boolean = true;
    let result: string = "";
    switch (flag) {
        case true:
            result = "true_value";
            break;
        case false:
            result = "false_value";
            break;
    }
}
