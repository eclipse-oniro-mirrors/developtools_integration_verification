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
 * @id STMT_08_15_3_007_FAIL_try_finally_nested_function
 * @expect compile-fail
 * @section 8.15.3
 * @design 验证在 finally 块内定义嵌套函数导致编译错误。ArkTS 禁止嵌套函数定义。
 * @note 反向测试：finally 块内 function 定义违反 ArkTS 约束，编译器应报错。
 */
function testTryFinallyNestedFunction(): void {
    let x: int = 0;
    try {
        x = 1;
    } finally {
        function nestedInFinally(): void {
            x = 2;
        }
    }
}
