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
 * @id STMT_08_13_006_FAIL_string_case_on_int_switch
 * @expect compile-fail
 * @section 8.13
 * @design int类型switch表达式中case使用string类型字面量，case类型不可赋值给switch类型应报编译时错误
 * @note 规范要求case表达式类型必须可赋值给switch表达式类型，string不能赋值给int故编译报错
 */
function testStringCaseOnIntSwitch(): void {
    let x: int = 1;
    switch (x) {
        case "one":
            break;
        default:
            break;
    }
}
