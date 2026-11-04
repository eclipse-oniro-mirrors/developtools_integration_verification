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
 * @id STMT_08_12_003_PASS_return_expression_matching_type
 * @expect compile-pass
 * @section 8.12
 * @design 测试返回表达式类型匹配函数返回类型的return语句
 * @note 正向测试：string/int/boolean/types类型函数返回相应类型的表达式，类型可赋值故编译通过
 */
function testReturnString(): string {
    return "hello";
}

function testReturnInt(): int {
    return 42;
}

function testReturnBoolean(): boolean {
    return true;
}

function testReturnNumber(): number {
    return 3.14;
}
