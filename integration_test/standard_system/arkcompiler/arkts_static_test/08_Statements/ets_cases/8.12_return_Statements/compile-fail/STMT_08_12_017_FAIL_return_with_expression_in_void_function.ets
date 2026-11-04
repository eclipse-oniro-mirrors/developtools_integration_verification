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
 * @id STMT_08_12_017_FAIL_return_with_expression_in_void_function
 * @expect compile-fail
 * @section 8.12
 * @design 测试void函数中带表达式的return语句产生编译错误
 * @note 反向测试：void函数return带表达式违反规范"Return expression type must be assignable to function return type"，int表达式不可赋值给void
 */
function testReturnExprInVoid(): void {
    let x: int = 10;
    if (x > 5) {
        return x;
    }
}

function testReturnStringInVoid(): void {
    return "unexpected";
}
