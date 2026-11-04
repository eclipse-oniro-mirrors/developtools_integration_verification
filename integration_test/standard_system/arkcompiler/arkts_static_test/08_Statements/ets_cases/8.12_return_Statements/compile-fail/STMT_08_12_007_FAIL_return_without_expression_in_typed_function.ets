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
 * @id STMT_08_12_007_FAIL_return_without_expression_in_typed_function
 * @expect compile-fail
 * @section 8.12
 * @design 测试非void/非undefined返回类型函数中无表达式return产生编译错误
 * @note 反向测试：返回类型为string的函数不允许使用无表达式return，违反规范"Otherwise compile-time error"
 */
function testReturnWithoutExpr(): string {
    let x: int = 0;
    if (x == 0) {
        return;
    }
    return "ok";
}
